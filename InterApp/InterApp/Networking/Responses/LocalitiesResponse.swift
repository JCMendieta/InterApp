//
//  LocalitiesResponse.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

struct LocalidadResponse: Decodable {
    let localidades: [LocalidadDTO]
}

//TODO: - Agregar mapeo de nombres a camelCase.
struct LocalidadDTO: Decodable {
    let IdLocalidad: String?
    let IdTipoLocalidad: String?
    let IdAncestroPGrado: String?
    let IdAncestroSGrado: String?
    let NombreAncestroSGrado: String?
    let IdAncestroTGrado: String?
    let NombreAncestroTGrado: String?
    let Nombre: String?
    let NombreCorto: String?
    let NombreAncestroPGrado: String?
    let NombreCompleto: String?
    let NombreTipoLocalidad: String?
    let AsignadoEnZona: Bool?
    let AsignadoEnZonaOrig: Bool?
    let DispoLocalidad: Bool?
    let NombreZona: String?
    let CodigoPostal: String?
    let Indicativo: String?
    let IdCentroServicio: Int?
    let EstadoRegistro: Int?
    let TiposLocalidades: [String]?
    let PermiteRecogida: Bool?
    let HoraMaxRecogida: Int?
    let SeGeorreferencia: Bool?
    let ValorRecogida: Double?
    let PermitePreEnviosPunto: Bool?
    let EtiquetaEntrega: Bool?
    let HoraMinRecogida: Int?
    let AbreviacionCiudad: String?
}
