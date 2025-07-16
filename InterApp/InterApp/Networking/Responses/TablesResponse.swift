//
//  TablesResponse.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import Foundation

struct EsquemaTablaDTO: Codable, Identifiable {
    let id = UUID()
    let nombreTabla: String
    let pk: String
    let queryCreacion: String
    let batchSize: Int
    let filtro: String
    let error: String?
    let numeroCampos: Int
    let metodoApp: String?
    let fechaActualizacionSincro: String
    
    enum CodingKeys: String, CodingKey {
        case nombreTabla = "NombreTabla"
        case pk = "Pk"
        case queryCreacion = "QueryCreacion"
        case batchSize = "BatchSize"
        case filtro = "Filtro"
        case error = "Error"
        case numeroCampos = "NumeroCampos"
        case metodoApp = "MetodoApp"
        case fechaActualizacionSincro = "FechaActualizacionSincro"
    }
}
