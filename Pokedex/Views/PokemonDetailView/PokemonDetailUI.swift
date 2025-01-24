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
        VStack {
            
            Image(uiImage: (pokemon.image ?? UIImage(named: "dummy.bulbasur"))!)
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
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
            
            Spacer()
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

#Preview {
    PokemonDetailUI(pokemon: Pokemon(id: 1,
                                     name: "Bulbasour",
                                     image: UIImage(named: "dummy.bulbasur"),
                                     PokemonTypes: [PokemonTypeData(id: 1,
                                                                    name: "grass",
                                                                    names: [TypeName(language: .some(Generation(name: "", url: "")) , name: "")])]))
}
