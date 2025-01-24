//
//  Pokemon.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 16/01/25.
//

import UIKit

class Pokemon {
    let id: Int
    let name: String
    let image: UIImage?
    let pokemonTypes: [PokemonTypeData]

    init(id: Int, name: String, image: UIImage?, PokemonTypes: [PokemonTypeData]) {
        self.id = id
        self.name = name
        self.image = image
        self.pokemonTypes = PokemonTypes
    }
}
