//
//  PokemonDetailUI.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 23/01/25.
//

import SwiftUI

struct PokemonDetailUI: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            
            Color.pokedexScreenBackground.ignoresSafeArea()
            
            VStack {
                
                Image(uiImage: (pokemon.image ?? UIImage(named: "dummy.bulbasur"))!)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                HStack {
                    Text("Height: \(pokemon.pokemonDescription.height) ft")
                        .font(.subheadline)
                        .fontDesign(.rounded)
                        .bold()
                    Text("Weight: \(pokemon.pokemonDescription.weight) lbs")
                        .font(.subheadline)
                        .fontDesign(.rounded)
                        .bold()
                    Text("Base Experience: \(pokemon.pokemonDescription.baseExperience)")
                        .font(.subheadline)
                        .fontDesign(.rounded)
                        .bold()
                }
                
                if pokemon.pokemonTypes.count == 1 {
                    LazyVGrid(columns: [GridItem(.fixed(100))],alignment: .center, content: {
                        ForEach(pokemon.pokemonTypes, id: \.id) { type in
                            PokemonTypeUI(typeName: type.name ?? "N/A")
                        }
                    })
                } else {
                    LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100))],alignment: .center, content: {
                        ForEach(pokemon.pokemonTypes, id: \.id) { type in
                            PokemonTypeUI(typeName: type.name ?? "N/A")
                        }
                    })
                }
                
                ScrollView {
                    Text(pokemon.pokemonDescription.description)
                        .font(.callout)
                        .fontDesign(.rounded)
                    .bold()
                }
                
                Spacer()
            }
            .navigationTitle(pokemon.name.capitalized)
        }
    }
}


#Preview {
    PokemonDetailUI(pokemon: Pokemon(id: 1,
                                     name: "Bulbasour",
                                     image: UIImage(named: "dummy.bulbasur"),
                                     PokemonTypes: [PokemonTypeData(id: 1,
                                                                    name: "grass",
                                                                    names: [TypeName(language: .some(Generation(name: "", url: "")) , name: "")])], pokemoDescription: PokemonDescription(description: "Pokemon", height: 0, weight: 0, baseExperience: 0)))
}
