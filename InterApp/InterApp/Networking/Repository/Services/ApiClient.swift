//
//  APIClient.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

protocol APIClientProtocol {
    func fetch(from url: URL) async throws -> Data
}

final class URLSessionApiClientWrapper: APIClientProtocol {
    func fetch(from url: URL) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APIError.responseStatusNotSuccesful
            }
                
            return data
        } catch {
            throw APIError.requestFailed
        }
    }
}
