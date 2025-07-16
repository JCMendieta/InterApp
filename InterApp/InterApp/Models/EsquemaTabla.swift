//
//  EsquemaTabla.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import Foundation

struct EsquemaTabla: Identifiable {
    let id = UUID()
    let nombreTabla: String
    let pk: String
    let queryCreacion: String
    let batchSize: Int
    let filtro: String
    let error: String
    let numeroCampos: Int
    let metodoApp: String
    let fechaActualizacionSincro: String
    
    init(dto: EsquemaTablaDTO) {
        self.nombreTabla = dto.nombreTabla
        self.pk = dto.pk
        self.queryCreacion = dto.queryCreacion
        self.batchSize = dto.batchSize
        self.filtro = dto.filtro
        self.error = dto.error ?? ""
        self.numeroCampos = dto.numeroCampos
        self.metodoApp = dto.metodoApp ?? ""
        self.fechaActualizacionSincro = dto.fechaActualizacionSincro
    }
    
    init(realmObject: PersistedEsquemaTabla) {
        self.nombreTabla = realmObject.nombreTabla
        self.pk = realmObject.pk
        self.queryCreacion = realmObject.queryCreacion
        self.batchSize = realmObject.batchSize
        self.filtro = realmObject.filtro
        self.error = realmObject.error ?? ""
        self.numeroCampos = realmObject.numeroCampos
        self.metodoApp = realmObject.metodoApp ?? ""
        self.fechaActualizacionSincro = realmObject.fechaActualizacionSincro
    }
}
