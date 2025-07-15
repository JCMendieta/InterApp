//
//  InterEndpointTests.swift
//  InterAppTests
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import XCTest
@testable import InterApp

final class InterEndpointTests: XCTestCase {

    //MARK: - Tests Success Cases
    
    func testUrlString_localities() {
        // Given
        let localitiesEndpoint = InterEndpoint.localities
        let expectedURLString = "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
        
        // When
        let urlString = localitiesEndpoint.urlString
        
        // Then
        XCTAssertEqual(urlString, expectedURLString)
    }
    
    func testAsURL_localities() {
        // Given
        let localitiesEndpoint = InterEndpoint.localities
        let expectedURL = URL(string: "https://apitesting.interrapidisimo.co/apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas")
        
        // When
        let url = try! localitiesEndpoint.asURL()
        
        // Then
        XCTAssertEqual(url, expectedURL)
    }
}
