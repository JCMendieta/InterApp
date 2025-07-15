//
//  JSONDecoderWrapperTests.swift
//  InterAppTests
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import XCTest
@testable import InterApp

final class JSONDecoderWrapperTests: XCTestCase {
    
    //MARK: - SetUp
    
    struct TestModel: Codable, Equatable {
        let id: Int
        let name: String
    }
    
    var sut: JSONDecoderWrapper!
    
    override func setUp() {
        super.setUp()
        sut = JSONDecoderWrapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Tests Sucess cases
    
    func testDecodeValidJSON() throws {
        // Given
        let json = """
        {
            "id": 1,
            "name": "Test"
        }
        """.data(using: .utf8)!
        
        // When
        let decoded = try sut.decode(TestModel.self, from: json)
        
        // Then
        XCTAssertEqual(decoded.id, 1)
        XCTAssertEqual(decoded.name, "Test")
    }
    
    //MARK: - Tests Failure Cases
    
    func testDecodeInvalidJSON() {
        // Given
        let invalidJSON = "invalid json".data(using: .utf8)!
        
        // When - Then
        XCTAssertThrowsError(try sut.decode(TestModel.self, from: invalidJSON)) { error in
            XCTAssertTrue(error is APIError)
            if case APIError.decodingError = error {
                // Success
            } else {
                XCTFail("Error inesperado: \(error)")
            }
        }
    }
}
