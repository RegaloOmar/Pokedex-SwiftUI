//
//  PokemonNetworkError.swift
//  Pokedex
//
//  Created by Omar Regalado Mendoza on 10/01/25.
//

import Foundation

public enum PokemonNetworkError: Error, Equatable {
    /// No internet connection.
    case noInternetConnection

    /// Server error with a specific status code.
    case serverError(statusCode: Int)

    /// Request timeout.
    case requestTimeout

    /// Invalid URL.
    case invalidURL

    /// Invalid response from the server.
    case invalidResponse

    /// Invalid response from the server.
    case badRequest

    /// Unauthorized access.
    case unauthorized

    /// Resource not found.
    case notFound

    /// Error in decodign
    case decodingError

    /// Generic other error with a custom message.
    case otherCode(code: Int)

    /// Generic other error with a custom message.
    case other(message: String)

    /**
     A localized description of the error.
     
     This computed property returns a human-readable description of the error based on its case. It provides additional context about the nature of the error.

     - Returns:
        A string describing the error.
     */
    public var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return "No internet connection."
        case .serverError(let statusCode):
            return "Server error: \(statusCode)"
        case .requestTimeout:
            return "Request timeout."
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response from server."
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized access."
        case .notFound:
            return "Resource not found."
        case .decodingError:
            return "Error in decoding data"
        case .other(let message):
            return message
        case .otherCode(let code):
            return "Other code: \(code)"
        }
    }
}
