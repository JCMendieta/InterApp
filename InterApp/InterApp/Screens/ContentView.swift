//
//  ContentView.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
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
    ContentView()
}
