//
//  CacheManager.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 06/02/25.
//

import Foundation

final class CacheManager {
    
    public static let shared = CacheManager()
    
    private var pokemonInformationCache: NSCache<NSString, PokemonDataWrapper> = NSCache()
    
    public func setPokemonInfoCache(_ data: PokemonDataWrapper, for Key: String) {
        pokemonInformationCache.setObject(data, forKey: Key as NSString)
    }
    
    public func getPokemonInfoCache(forKey key: String) -> PokemonDataWrapper? {
        return pokemonInformationCache.object(forKey: key as NSString)
    }
}
