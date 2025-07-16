//
//  ApiError.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

/// Enum que define los posibles errores que pueden ocurrir durante las llamadas a la API.
enum APIError: Error {
    /// Este error típicamente indica que la estructura de los datos recibidos
    /// no coincide con los modelos esperados por la aplicación.
    case decodingError
    /// Error que ocurre cuando la respuesta del servidor no tiene un código de estado exitoso.
    case responseStatusNotSuccesful
    /// Error que ocurre cuando la solicitud a la API falla.
    case requestFailed
    /// Error que ocurre cuando no se puede crear una URL válida.
    case invalidURL
    ///  Error que ocurre cuando response no es transformable a HTTPResponse
    case invalidResponse
    
    /// Proporciona un mensaje de error para el usuario.
    ///
    /// - Returns: Un `String` con un mensaje descriptivo del error.
    var errorMessage: String {
        switch self {
        case .decodingError:
            return "Hay problemas con la operación, intenta mas tarde."
        case .responseStatusNotSuccesful, .requestFailed, .invalidURL, .invalidResponse:
            return "La petición no fue exitosa."
        }
    }
}
