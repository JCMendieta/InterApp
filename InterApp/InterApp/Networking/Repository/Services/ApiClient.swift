//
//  APIClient.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

protocol APIClientProtocol {
    /// Realiza una solicitud generica al endpoint especificado.
    ///
    /// - Parameters:
    ///     - url: La URL del endpoint al que se debe realizar la solicitud.
    ///     - method: El método HTTP a utilizar para la solicitud (p. ej., "GET", "POST").
    ///     - headers: Un diccionario opcional con las cabeceras HTTP para la solicitud.
    ///     - body: Los datos opcionales que se enviarán en el cuerpo de la solicitud ("POST").
    /// - Returns: Los datos binarios ('Data') de la respuesta si la solicitud es exitosa.
    /// - Throws: Un error de tipo 'APIError' si la solicitud falla en cualquier punto.
    func fetch(from url: URL, method: String, headers: [String: String]?, body: Data?) async throws -> Data
}

/// Esta clase maneja las solicitudes de red utilizando la API nativa de URLSession de Apple.
final class URLSessionApiClientWrapper: APIClientProtocol {
    func fetch(from url: URL, method: String = "GET", headers: [String:String]? = nil, body: Data? = nil) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        /// - Note: Este método verifica que la respuesta tenga un código de estado HTTP 200 o exitoso.
        ///   Cualquier otro código de estado será tratado como un error.
        //TODO: - Implementar manejo de diferentes respuestas.
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw APIError.responseStatusNotSuccesful
        }
        
        return data
    }
}
