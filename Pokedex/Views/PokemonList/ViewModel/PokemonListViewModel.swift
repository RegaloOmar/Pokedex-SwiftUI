//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 14/01/25.
//

import Foundation
import UIKit

@MainActor
class PokemonListViewModel: ObservableObject {
    
    private var networkService: PokemonNetworkServiceProtocol
    
    @Published var isLoading: Bool = false
    @Published var pokemonsList: [Pokemon] = []
    
    init(networkService: PokemonNetworkServiceProtocol = PokemonNetworkData()) {
        self.networkService = networkService
        isLoading = true
    }
    
    func fetchPokemonList() async {
        let result = await networkService.getPokemonList()
        switch result {
            case .success(let pokemons):
                let pokemons = await getPokemonFullInformation(pokemonList: pokemons)
                switch pokemons {
                    case .success(let pokemonlist):
                        for pokemon in pokemonlist {
                            self.pokemonsList.append(pokemon)
                        }
                        isLoading = false
                    case .failure(let error):
                        print("Error fetching Pokemon list: \(error)")
                }
            case .failure(let error):
                print("Error fetching Pokemon list: \(error)")
        }
        
    }
    
    func getPokemonFullInformation(pokemonList: [ResultData]) async -> Result<[Pokemon], PokemonNetworkError> {
        
        let results = await withTaskGroup(of: Result<Pokemon, PokemonNetworkError>.self, returning: Result<[Pokemon], PokemonNetworkError>.self) {
            taskGroup in
            
            for pokemonData in pokemonList {
                
                taskGroup.addTask { [self] in
                    let pokemonInfo = await networkService.getPokemonInformation(urlString: pokemonData.url)
                    
                    switch pokemonInfo {
                        case .success(let information):
                            
                            let pokemonImage = await getPokemonsImage(imageURL: information.sprites?.other?.officialArtwork?.frontDefault)
                            let pokemonTypes = await getPokemonTypes(elements: information.types)
                            let name = information.name ?? "No Name"
                            let id = information.id ?? 0
                            let height = information.height ?? 0
                            let weight = information.weight ?? 0
                            let baseExperience = information.baseExperience ?? 0
                            let pokemonDetails = await getPokemonDetails(id: id)
                            let pokemonDescription = PokemonDescription(description: pokemonDetails,
                                                                        height: height, weight: weight,
                                                                        baseExperience: baseExperience)
                            
                            let pokemon = Pokemon(id: id, name: name, image: pokemonImage, PokemonTypes: pokemonTypes, pokemoDescription: pokemonDescription)
                            
                            return .success(pokemon)
                        case .failure(let error):
                            return .failure(error)
                    }
                }
            }
            
            var result = await taskGroup.reduce(into: [Pokemon]()) { partialResult, result in
                switch result {
                    case .success(let pokemon):
                        partialResult.append(pokemon)
                    case .failure( _):
                        break
                }
            }
            
            result = result.sorted(by: { pokemonOrderBefore, pokemonOrderNext in
                pokemonOrderBefore.id < pokemonOrderNext.id
            })
            
            return .success(result)
        }
        
        return results
    }
    
    func getPokemonsImage(imageURL: String?) async -> UIImage? {
        
        guard let url = imageURL else {
            return nil
        }
        
        let imageResults = await networkService.getPokemonImage(urlString: url)
        
        switch imageResults {
            case .success(let image):
                return image
            case .failure(_):
                return nil
        }
    }
    
    func getPokemonTypes(elements: [TypeElement]?) async -> [PokemonTypeData] {
        guard let elements = elements else {
            return []
        }
        
        let resultTypes = await withTaskGroup(of: Result<PokemonTypeData, PokemonNetworkError>.self, returning: [PokemonTypeData].self) { taskGroup in
            
            for element in elements {
                if let url = element.type?.url {
                    taskGroup.addTask { [self] in
                        let result = await networkService.getPokemonTypes(urlString: url)
                        
                        switch result {
                            case .success(let dataType):
                                return .success(dataType)
                            case .failure(let error):
                                return .failure(error)
                        }
                    }
                }
            }
            
            var typeList = await taskGroup.reduce(into: [PokemonTypeData]()) { partialResult, result in
                
                switch result {
                    case .success(let type):
                        partialResult.append(PokemonTypeData(id: type.id, name: type.name, names: type.names))
                    case .failure(_):
                        break
                }
            }
            
            typeList = typeList.sorted(by: { pokemonOrderBefore, pokemonOrderNext in
                guard let beforeId = pokemonOrderBefore.id, let nextId = pokemonOrderNext.id else {
                    return false
                }
                return beforeId > nextId
            })
            
            return typeList
        }
        
        return resultTypes
    }
    
    func getPokemonDetails(id: Int) async -> String {
        
        let result = await networkService.getPokemonDetails(id: id)
        
        switch result {
            case .success(let data):
                var description = ""
                data.flavorTextEntries?.forEach({ flavorTextEntry in
                    if let text = flavorTextEntry.flavorText, let language = flavorTextEntry.language?.name, language == "en" {
                        if description.contains(text) == false {
                            description += text
                        }
                    }
                })
                return description.formattedText()
            case .failure(_):
                return "No information about this pokémon"
        }
    }
}
