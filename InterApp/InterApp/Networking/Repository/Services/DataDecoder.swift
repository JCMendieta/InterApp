//
//  DataDecoder.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

protocol DataDecoderProtocol {
    func decode<T: Decodable>(_ dataType: T.Type, from data: Data) throws -> T
}

final class JSONDecoderWrapper: DataDecoderProtocol {
    func decode<T>(_ dataType: T.Type, from data: Data) throws -> T where T: Decodable {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(dataType, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
