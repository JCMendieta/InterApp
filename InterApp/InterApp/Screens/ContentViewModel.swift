//
//  ContentViewModel.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var localities: [Localidad] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
    }
    
    @MainActor
    func bringLocalitiesData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let localities = try await repository.fetchLocalitiesCollected()
            
            self.localities = localities.map { Localidad(dto: $0) }
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching localities: \(error)")
        }
        
        isLoading = false
    }
}
