//
//  ServicesManager.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

/// Orquestador para la solicitud de datos y su posterior
/// decodificación en un tipo de entidad específico.
protocol ServicesManagerProtocol {
    /// Realiza una solicitud de red a una URL y decodifica la respuesta en un objeto `Decodable`.
    ///
    /// Esta función es asíncrona y genérica, lo que le permite trabajar con cualquier
    /// tipo de dato que se ajuste al protocolo `Decodable`.
    ///
    /// - Parameters:
    ///   - url: La URL del endpoint al que se debe realizar la solicitud.
    ///   - entity: El metatipo de la entidad (`.self`) que se espera decodificar.
    ///             Esto le indica a la función en qué estructura de datos transformar la respuesta.
    /// - Returns: Una instancia del tipo `T` decodificada a partir de la respuesta de la red.
    /// - Throws: Un error si la solicitud de red falla o si el proceso de decodificación
    ///           no tiene éxito.
    func request<T: Decodable>(_ url: URL, entity: T.Type) async throws -> T
}

final class ServicesManager: ServicesManagerProtocol {
    let apiClient: APIClientProtocol
    let dataDecoder: DataDecoderProtocol
    
    init(apiClient: APIClientProtocol, dataDecoder: DataDecoderProtocol) {
        self.apiClient = apiClient
        self.dataDecoder = dataDecoder
    }
    
    func request<T: Decodable>(_ url: URL, entity: T.Type) async throws -> T {
        do {
            let data = try await apiClient.fetch(from: url)
            let entity = try dataDecoder.decode(T.self, from: data)
            return entity
        } catch {
            throw error
        }
    }
}
