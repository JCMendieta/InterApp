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
    case appVersion
    case authenticate
    
    /// La URL base del endpoint como String.
    /// - Returns: La URL completa del endpoint como String.
    var urlString: String {
        switch self {
        case .localities:
            return "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
        case .appVersion:
            return "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ConsultarParametrosFramework/VPStoreAppControl"
        case .authenticate:
            return "https://apitesting.interrapidisimo.co/FtEntregaElectronica/MultiCanales/ApiSeguridadPruebas/api/Seguridad/AuthenticaUsuarioApp"
        }
    }
    
    var method: String {
        switch self {
        case .localities, .appVersion:
            return "GET"
        case .authenticate:
            return "POST"
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .authenticate:
            return [
                "Usuario": "pam.meredy21",
                "Identificacion": "987204545",
                "Accept": "text/json",
                "IdUsuario": "pam.meredy21",
                "IdCentroServicio": "1295",
                "NombreCentroServicio": "PTO/BOGOTA/CUND/COL/OF PRINCIPAL - CRA 30 # 7-45",
                "IdAplicativoOrigen": "9",
                "Content-Type": "application/json"
            ]
        default:
            return [:]
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
        case .localities, .appVersion, .authenticate:
            return url
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
