//
//  APIClient.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

protocol APIClientProtocol {
    /// Realiza una solicitud GET al endpoint especificado.
    ///
    /// - Parameter url: La URL del recurso a solicitar.
    /// - Returns: Los datos binarios de la respuesta.
    /// - Throws: Un error de tipo `APIError` si la solicitud falla.
    func fetch(from url: URL) async throws -> Data
}

/// Esta clase maneja las solicitudes de red utilizando la API nativa de URLSession de Apple.
final class URLSessionApiClientWrapper: APIClientProtocol {
    func fetch(from url: URL) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            /// - Note: Este método verifica que la respuesta tenga un código de estado HTTP 200.
            ///   Cualquier otro código de estado será tratado como un error.
            //TODO: - Implementar manejo de diferentes respuestas.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APIError.responseStatusNotSuccesful
            }
                
            return data
        } catch {
            throw APIError.requestFailed
        }
    }
}
