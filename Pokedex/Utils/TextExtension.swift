//
//  TextExtension.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 05/02/25.
//

import Foundation

extension String {
    
    func formattedText() -> String {
        var noNewLines = description.replacingOccurrences(of: "\n", with: " ")
        var formattedString = noNewLines.replacingOccurrences(of: ".", with: ". \n")
        return formattedString.capitalized
    }
}
