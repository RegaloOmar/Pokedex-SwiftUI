//
//  PokemonDescription.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 16/01/25.
//

import Foundation
import UIKit

struct PokemonDescription {
    var description: String
    let height: Int
    let weight: Int
    let baseExperience: Int
    var evolutionChain: [(in: Pokemon, to: Pokemon)]
}
