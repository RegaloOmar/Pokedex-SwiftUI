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
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.green)
            
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
                VStack {
                    
                    Text(pokemonName)
                        .foregroundStyle(Color.white)
                        .textInputAutocapitalization(.words)
                        .bold()
                        .padding()
                    
                    Spacer()
                }
                .padding(.trailing, -15)
                .padding(.leading, -8)
                
                Spacer()
                
                VStack {
                    Text(pokemonNumber)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.white)
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
                  pokemonImage: UIImage(named: "dummy.bulbasur")!)
}
