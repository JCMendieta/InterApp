//
//  AuthResponse.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import Foundation

struct AuthResponse: Decodable {
    let usuario: String
    let identificacion: String?
    let nombre: String?
    let apellido1: String?
    let apellido2: String?
    let cargo: String?
    let aplicaciones: [String]?
    let ubicaciones: [String]?
    let mensajeResultado: Int
    let idLocalidad: String?
    let nombreLocalidad: String?
    let nomRol: String?
    let idRol: String?
    let tokenJWT: String?
    let modulosApp: [String]?
    
    enum CodingKeys: String, CodingKey {
        case usuario = "Usuario"
        case identificacion = "Identificacion"
        case nombre = "Nombre"
        case apellido1 = "Apellido1"
        case apellido2 = "Apellido2"
        case cargo = "Cargo"
        case aplicaciones = "Aplicaciones"
        case ubicaciones = "Ubicaciones"
        case mensajeResultado = "MensajeResultado"
        case idLocalidad = "IdLocalidad"
        case nombreLocalidad = "NombreLocalidad"
        case nomRol = "NomRol"
        case idRol = "IdRol"
        case tokenJWT = "TokenJWT"
        case modulosApp = "ModulosApp"
    }
}

struct AuthRequest: Encodable {
    let mac: String
    let nomAplicacion: String
    let password: String
    let path: String
    let usuario: String
    
    enum CodingKeys: String, CodingKey {
        case mac = "Mac"
        case nomAplicacion = "NomAplicacion"
        case password = "Password"
        case path = "Path"
        case usuario = "Usuario"
    }
}
