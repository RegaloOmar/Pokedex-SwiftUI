//
//  PokemonTypesColor.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 21/01/25.
//

import Foundation
import SwiftUI

enum PokemonTypeColor: String {
    case normal = "Normal"
    case fire = "Fire"
    case water = "Water"
    case grass = "Grass"
    case electric = "Electric"
    case ice = "Ice"
    case fighting = "Fighting"
    case poison = "Poison"
    case ground = "Ground"
    case flying = "Flying"
    case psychic = "Psychic"
    case bug = "Bug"
    case rock = "Rock"
    case ghost = "Ghost"
    case dark = "Dark"
    case dragon = "Dragon"
    case steel = "Steel"
    case fairy = "Fairy"
    case defaultPokemon = "default"
}

extension Color {
    
    static func getPokemonTypeColor(_ type: String) -> Color {
        guard let pokemonType = PokemonTypeColor(rawValue: type.capitalized) else {
                return Color.gray
            }
            
            switch pokemonType {
            case .normal: 
                    return Color.normalType
            case .fire:
                    return Color.fireType
            case .water:
                    return Color.waterType
            case .grass:
                    return Color.grassType
            case .electric:
                    return Color.electricType
            case .ice:
                    return Color.iceType
            case .fighting:
                    return Color.fightingType
            case .poison:
                    return Color.poisonType
            case .ground:
                    return Color.groundType
            case .flying:
                    return Color.flyingType
            case .psychic:
                    return Color.psychicType
            case .bug:
                    return Color.bugType
            case .rock:
                    return Color.rockType
            case .ghost:
                    return Color.ghostType
            case .dark:
                    return Color.darkType
            case .dragon:
                    return Color.dragonType
            case .steel:
                    return Color.steelType
            case .fairy:
                    return Color.fairyType
            case .defaultPokemon:
                    return Color.gray
            }
        }
}
