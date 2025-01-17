//
//  PokemonListData.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 10/01/25.
//

import Foundation

// MARK: - PokemonList
struct PokemonListData: Codable {
    let count: Int?
    let previous: String?
    let next: String?
    let results: [ResultData]?
}

// MARK: - Result
struct ResultData: Codable {
    let name: String
    let url: String
}
