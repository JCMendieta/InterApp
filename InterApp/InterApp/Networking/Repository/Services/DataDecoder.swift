//
//  DataDecoder.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation
import XMLCoder

protocol DataDecoderProtocol {
    /// Decodifica datos en una instancia de un tipo específico.
    ///
    /// - Parameters:
    ///   - dataType: El tipo de objeto (`T.Type`) al que se deben decodificar los datos.
    ///   - data: El objeto `Data` que contiene la información a decodificar.
    /// - Returns: Una instancia del tipo `T` decodificada a partir de los datos.
    /// - Throws: Un error si el proceso de decodificación falla (p. ej., `APIError.decodingError`).
    func decode<T: Decodable>(_ dataType: T.Type, from data: Data) throws -> T
}

/// Utiliza la clase `JSONDecoder` nativa de Swift para realizar la transformación.
final class JSONDecoderWrapper: DataDecoderProtocol {
    /// Decodifica un objeto `Data` que contiene JSON en una instancia de un tipo `Decodable`.
    func decode<T>(_ dataType: T.Type, from data: Data) throws -> T where T: Decodable {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(dataType, from: data)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }
}

/// Una clase para decodificar datos en formato XML.
///
/// Está configurada para manejar claves en formato "Capitalized" y para procesar
/// espacios de nombres XML.
final class XMLDecoderWrapper: DataDecoderProtocol {
    private let decoder: XMLDecoder
    
    /// Inicializa el decodificador de XML con una configuración específica.
    init() {
        self.decoder = XMLDecoder()
        self.decoder.keyDecodingStrategy = .convertFromCapitalized
        self.decoder.shouldProcessNamespaces = true
    }
    
    /// Decodifica un objeto `Data` que contiene XML en una instancia de un tipo `Decodable`.
    func decode<T: Decodable>(_ dataType: T.Type, from data: Data) throws -> T {
        do {
            return try decoder.decode(dataType, from: data)
        } catch {
            print("XML Decoding Error: \(error)")
            throw APIError.decodingError
        }
    }
}
