//
//  PokemonNetworkData.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 10/01/25.
//

import Foundation
import UIKit

final class PokemonNetworkData: PokemonNetworkServiceProtocol {
    
    private var nextPage = ""
    
    
    public func getPokemonList() async -> Result<[ResultData], PokemonNetworkError> {
        
        let url = nextPage.isEmpty ? PokemonAPIConstans.getPokemonListURL() : nextPage
        
        let results: ServiceStatus<PokemonListData?> = await ServiceCoordinator.shared.sendRequest(url: url)
        
        switch results {
            case .success(let data):
                nextPage = data?.next ?? "No more Pokemons :("
                guard let list = data?.results else {
                    return .failure(.notFound)
                }
                return .success(list)
            case .failed(let error):
                return .failure(error)
            case .information(let code):
                return .failure(.otherCode(code: code))
        }
    }
    
    func getPokemonInformation(urlString: String) async -> Result<PokemonData, PokemonNetworkError> {
        
        let result: ServiceStatus<PokemonData?> = await ServiceCoordinator.shared.sendRequest(url: urlString)
        
        switch result {
            case .success(let data):
                guard let data = data else {
                    return .failure(.notFound)
                }
                return.success(data)
            case .failed(let error):
                return .failure(error)
            case .information(let code):
                return .failure(.otherCode(code: code))
        }
    }
    
    func getPokemonImage(urlString: String) async -> Result<UIImage, PokemonNetworkError> {
        
        let result: ServiceStatus<Data?> = await ServiceCoordinator.shared.sendRequest(url: urlString)
        
        switch result {
            case .success(let data):
                if let data = data, let image = UIImage(data: data) {
                    return .success(image)
                } else {
                    return .failure(.notFound)
                }
            case .failed(let error):
                return .failure(error)
            case .information(let code):
                return .failure(.otherCode(code: code))
        }
        
    }
    
    func getPokemonTypes(urlString: String) async -> Result<PokemonTypeData, PokemonNetworkError> {
        
        let result: ServiceStatus<PokemonTypeData?> = await ServiceCoordinator.shared.sendRequest(url: urlString)
        
        switch result {
            case .success(let dataType):
                if let dataType = dataType {
                    return .success(dataType)
                } else {
                    return .failure(.notFound)
                }
            case .failed(let error):
                return .failure(error)
            case .information(let code):
                return .failure(.otherCode(code: code))
        }
    }
    
}
