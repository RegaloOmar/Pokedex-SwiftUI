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

    init(id: Int, name: String, image: UIImage?) {
        self.id = id
        self.name = name
        self.image = image
    }
}
