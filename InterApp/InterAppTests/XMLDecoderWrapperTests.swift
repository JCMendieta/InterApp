//
//  XMLDecoderWrapper.swift
//  InterAppTests
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import XCTest
import XMLCoder
@testable import InterApp

final class XMLDecoderWrapperTests: XCTestCase {
    
    //MARK: - SetUp
    
    struct TestModel: Decodable, Equatable {
        let id: Int
        let name: String
    }
    
    var sut: XMLDecoderWrapper!
    
    override func setUp() {
        super.setUp()
        sut = XMLDecoderWrapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Tests Sucess cases
    
    func testDecodeValidXML() throws {
        // Given
        let xml = """
                <?xml version="1.0" encoding="UTF-8"?>
                <testModel>
                    <id>123</id>
                    <name>Test Item</name>
                    <isActive>true</isActive>
                    <createdAt>2023-01-01T12:00:00Z</createdAt>
                </testModel>
                """.data(using: .utf8)!
        
        // When
        let decoded: TestModel = try sut.decode(TestModel.self, from: xml)
        
        // Then
        XCTAssertEqual(decoded.id, 123)
        XCTAssertEqual(decoded.name, "Test Item")
    }
}
