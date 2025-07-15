//
//  ApiError.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

enum APIError: Error {
    case decodingError
    case responseStatusNotSuccesful
    case requestFailed
    case invalidURL
    
    var errorMessage: String {
        switch self {
        case .decodingError:
            return "Hay problemas con la operación, intenta mas tarde."
        case .responseStatusNotSuccesful, .requestFailed, .invalidURL:
            return "La petición no fue exitosa."
        }
    }
}
