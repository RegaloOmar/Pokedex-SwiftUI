//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 10/01/25.
//

import SwiftUI
import SwiftData

@main
struct PokedexApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            PokemonListUI()
        }
    }
}
