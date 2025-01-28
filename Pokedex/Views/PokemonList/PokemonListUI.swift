//
//  PokemonListUI.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 14/01/25.
//

import SwiftUI

struct PokemonListUI: View {
    
    @StateObject private var viewModel: PokemonListViewModel = PokemonListViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading == true {
                LoaderCellUI()
            } else {
                NavigationSplitView {
                    ZStack {
                        Color.pokedexBackground
                            .ignoresSafeArea()
                        GeometryReader { geometry in
                            ScrollView {
                                LazyVGrid(columns: [GridItem(.fixed((geometry.size.width / 2) - 10)), GridItem(.fixed((geometry.size.width / 2) - 10))], spacing: 15.0, content: {
                                    ForEach(viewModel.pokemonsList, id: \.name) { pokemon in
                                        NavigationLink(destination: PokemonDetailUI(pokemon: pokemon)) {
                                            PokemonCellUI(pokemonNumber: String(format: "#%03d", pokemon.id),
                                                          pokemonName: pokemon.name.capitalized,
                                                          pokemonImage: pokemon.image,
                                                          pokemonTypes: pokemon.pokemonTypes)
                                            .frame(height: geometry.size.height/5)
                                            .onAppear {
                                                if pokemon.id == viewModel.pokemonsList.last?.id {
                                                    Task(priority: .userInitiated) {
                                                        await viewModel.fetchPokemonList()
                                                    }
                                                }
                                            }
                                        }
                                        
                                    }
                                })
                            }
                            .scrollIndicators(.hidden)
                            .toolbarBackground(Color.red, for: .navigationBar)
                            .toolbarTitleDisplayMode(.inlineLarge)
                            .toolbar {
                                Text("Pokedex")
                                    .foregroundStyle(Color.black)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                    }
                } detail: {
                    Text("Select a Pokemon")
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchPokemonList()
            }
        }
    }
}

#Preview {
    PokemonListUI()
        .preferredColorScheme(.dark)
}
