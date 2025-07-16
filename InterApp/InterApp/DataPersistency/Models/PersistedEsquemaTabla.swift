//
//  PersistedEsquemaTabla.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import RealmSwift

/// Representa el esquema de la tabla dentro de la base de datos local de Realm.
class PersistedEsquemaTabla: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var nombreTabla: String
    @Persisted var pk: String
    @Persisted var queryCreacion: String
    @Persisted var batchSize: Int
    @Persisted var filtro: String
    @Persisted var error: String?
    @Persisted var numeroCampos: Int
    @Persisted var metodoApp: String?
    @Persisted var fechaActualizacionSincro: String
    
    /// Crea una nueva instancia de `PersistedEsquemaTabla` a partir de un objeto `EsquemaTablaDTO`.
    convenience init(dto: EsquemaTablaDTO) {
        self.init()
        self.nombreTabla = dto.nombreTabla
        self.pk = dto.pk
        self.queryCreacion = dto.queryCreacion
        self.batchSize = dto.batchSize
        self.filtro = dto.filtro
        self.error = dto.error
        self.numeroCampos = dto.numeroCampos
        self.metodoApp = dto.metodoApp
        self.fechaActualizacionSincro = dto.fechaActualizacionSincro
    }
    
}
