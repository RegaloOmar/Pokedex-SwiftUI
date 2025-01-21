//
//  PokemonNetworkServiceProtocol.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 14/01/25.
//

import Foundation
import UIKit

protocol PokemonNetworkServiceProtocol {
    func getPokemonList() async -> Result<[ResultData], PokemonNetworkError>
    func getPokemonInformation(urlString: String) async -> Result<PokemonData, PokemonNetworkError>
    func getPokemonImage(urlString: String) async -> Result<UIImage, PokemonNetworkError>
    func getPokemonTypes(urlString: String) async -> Result<PokemonTypeData, PokemonNetworkError> 
}
