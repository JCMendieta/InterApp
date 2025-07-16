//
//  TablasScreenViewModel.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import Foundation

final class TablasScreenViewModel: ObservableObject {
    @Published var tableSchemas: [EsquemaTabla] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchTableSchemas() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let schemas = try await repository.fetchTableSchemas()
            
            self.tableSchemas = schemas.map { EsquemaTabla(dto: $0) }
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching table schemas: \(error)")
        }
        
        isLoading = false
    }
}
