//
//  InterEndpoint.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

enum InterEndpoint {
    case localities
    
    var urlString: String {
        switch self {
        case .localities:
            return "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
        }
    }
    
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
