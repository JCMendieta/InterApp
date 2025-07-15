//
//  Repository.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

protocol RepositoryProtocol {
//    func fetchLocalitiesCollected() async throws -> [Localidad]
}

final class Repository: RepositoryProtocol {
    private let servicesManager: ServicesManagerProtocol
    
    init(servicesManager: ServicesManagerProtocol = ServicesManager(
            apiClient: URLSessionApiClientWrapper(),
            dataDecoder: JSONDecoderWrapper())
    ) {
        self.servicesManager = servicesManager
    }
    
//    func fetchLocalitiesCollected() async throws -> Localidad {
//        guard let apiURL = try? InterEndpoint.localities.asURL() else {
//            throw APIError.invalidURL
//        }
//        
//        do {
//            return try await servicesManager.request(apiURL, entity: Localidad.self)
//        }
//    }
}
