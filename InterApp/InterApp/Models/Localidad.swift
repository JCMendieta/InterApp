//
//  LocalidadModel.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

struct Localidad: Identifiable {
    let id: UUID
    let nombreCompleto: String
    let abreviacionCiudad: String
    
    init( dto: LocalidadDTO) {
        self.id = UUID()
        self.nombreCompleto = dto.NombreCompleto ?? "Sin datos."
        self.abreviacionCiudad = dto.AbreviacionCiudad ?? "Sin datos."
    }
}
