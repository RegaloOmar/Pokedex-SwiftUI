//
//  PokemonCellUI.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 15/01/25.
//

import SwiftUI

struct PokemonCellUI: View {
    
    var pokemonNumber: String
    var pokemonName: String
    var pokemonImage: UIImage?
    var pokemonTypes: [String]
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.pokedexBackground)
            
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Image("pokeball.logo.black")
                        .resizable()
                    .frame(width: 100, height: 100, alignment: .bottom)
                }
            }
                
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(pokemonName)
                        .fixedSize()
                        .foregroundStyle(Color.primary)
                        .textInputAutocapitalization(.words)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: 50, maximum: 100)), GridItem(.adaptive(minimum: 50, maximum: 100))], alignment: .bottom, spacing: 1.0, content: {
                        ForEach(pokemonTypes, id: \.count) { type in
                            PokemonTypeUI(typeName: type)
                        }
                    })
                    .padding(.leading)
                    .padding(.bottom, 10)
                    
                }
                .padding(.trailing, -15)
                .padding(.leading, -8)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(pokemonNumber)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.primary)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    Image(uiImage: ((pokemonImage ?? UIImage(named: "dummy.bulbasur"))!))
                    .resizable()
                    .frame(width: 75, height: 75, alignment: .trailing)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    PokemonCellUI(pokemonNumber: "#001",
                  pokemonName: "Bulbasur",
                  pokemonImage: UIImage(named: "dummy.bulbasur")!, 
                  pokemonTypes: ["grass", "bug"])
}

struct PokemonTypeUI: View {
    
    var typeName: String
    
    var body: some View {
        Text(typeName.capitalized)
            .font(.system(size: 15.0))
            .foregroundStyle(Color.primary)
            .bold()
            .padding(.vertical, 5)
            .padding(.horizontal,8)
            .foregroundStyle(Color.white)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color.getPokemonTypeColor(typeName))
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 1.2)
                        .foregroundStyle(Color.primary)
                    
                }
            }
    }
}
