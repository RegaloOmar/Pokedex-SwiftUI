//
//  PokemonTypeData.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 14/01/25.
//

import Foundation

// MARK: - PokemonType
struct PokemonTypeData: Codable {
    let id: Int?
    let name: String?
    let names: [TypeName]?

    enum CodingKeys: String, CodingKey {
        case id, name, names
    }
}

// MARK: - Type Name
struct TypeName: Codable {
    let language: Generation?
    let name: String?
}

// MARK: - Pokemon Generation
struct Generation: Codable {
    let name: String?
    let url: String?
}

// MARK: - Pokemon Type Wrapper
class PokemonType {
    let data: PokemonTypeData

    init(data: PokemonTypeData) {
        self.data = data
    }
}
