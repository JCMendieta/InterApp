//
//  InterEndpoint.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

/// Enum que define los endpoints de la API de Interrapidisimo.
///
/// Este enum centraliza las URLs de los endpoints utilizados en la aplicación.
enum InterEndpoint {
    case localities
    
    /// La URL base del endpoint como String.
    /// - Returns: La URL completa del endpoint como String.
    var urlString: String {
        switch self {
        case .localities:
            return "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
        }
    }
    
    /// Convierte la URL del endpoint a un objeto URL.
    /// - Returns: Un objeto URL válido.
    /// - Throws: `APIError.invalidURL` si la URL no puede ser creada.
    /// - Note: Este método valida que la URL sea válida antes de devolverla.
    func asURL() throws -> URL {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        switch self {
        case .localities:
            return url
        }
    }
}
