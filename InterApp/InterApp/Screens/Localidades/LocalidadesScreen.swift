//
//  LocalidadesScreen.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar Strings a archivo dedicado
//TODO: - Agregar manejo de estados a la vista
struct LocalidadesScreen: View {
    @StateObject private var viewModel = LocalidadesScreenViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                ForEach(viewModel.localities) { locality in
                    VStack(alignment: .leading) {
                        Text(locality.nombreCompleto)
                            .font(.headline)
                        Text("ID: \(locality.abreviacionCiudad)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.bringLocalitiesData()
                }
            }
        }
    }
}

#Preview {
    LocalidadesScreen()
}
