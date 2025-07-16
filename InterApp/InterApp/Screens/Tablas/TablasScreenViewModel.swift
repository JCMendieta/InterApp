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
    private let realmManager = RealmManager.shared
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        loadCachedSchemas()
    }
    
    @MainActor
    func fetchTableSchemas() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let schemas = try await repository.fetchTableSchemas()
            let realmObject = schemas.map { PersistedEsquemaTabla(dto: $0)}
            
            realmManager.deleteAll(PersistedEsquemaTabla.self)
            realmManager.saveObject(realmObject)
            
            self.tableSchemas = schemas.map { EsquemaTabla(dto: $0) }
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching table schemas: \(error)")
        }
        
        isLoading = false
    }
    
    func loadCachedSchemas() {
        guard let realmObjects = realmManager.fetchObjects(PersistedEsquemaTabla.self) else {
            self.tableSchemas = []
            return
        }
        
        self.tableSchemas = Array(realmObjects).map { EsquemaTabla(realmObject: $0) }
    }
}
