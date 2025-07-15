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
        ZStack {
            Color.interMediumOrange
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 15) {
                    Text("Localidades")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.interBoneWhite)
                        .padding(.bottom, 10)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .tint(Color.interBoneWhite)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ForEach(viewModel.localities) { locality in
                            LocalidadCellView(locality: locality)
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .onAppear {
            Task {
                await viewModel.bringLocalitiesData()
            }
        }
    }
}

#Preview {
    LocalidadesScreen()
}
