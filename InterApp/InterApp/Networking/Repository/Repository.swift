//
//  Repository.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

/// Describe las operaciones de obtención de datos que la aplicación puede realizar.
/// Cualquier clase que se ajuste a este protocolo actúa como una fuente de datos
/// para la aplicación.
protocol RepositoryProtocol {
    /// Obtiene una lista de localidades.
    ///
    /// - Returns: Un array de objetos `LocalidadDTO`.
    /// - Throws: Un error si la obtención de los datos falla (p. ej., un error
    ///           de red o de decodificación).
    func fetchLocalitiesCollected() async throws -> [LocalidadDTO]
}

final class Repository: RepositoryProtocol {
    /// La instancia del gestor de servicios responsable de manejar las solicitudes de red.
    private let servicesManager: ServicesManagerProtocol
    
    /// - Parameter servicesManager: El gestor de servicios a utilizar. Si no se provee, se crea una instancia por defecto.
    init(servicesManager: ServicesManagerProtocol = ServicesManager(
            apiClient: URLSessionApiClientWrapper(),
            dataDecoder: JSONDecoderWrapper())
    ) {
        self.servicesManager = servicesManager
    }
    
    func fetchLocalitiesCollected() async throws -> [LocalidadDTO] {
        guard let apiURL = try? InterEndpoint.localities.asURL() else {
            throw APIError.invalidURL
        }
        
        do {
            return try await servicesManager.request(apiURL, entity: [LocalidadDTO].self)
        } catch {
            throw error
        }
    }
}
