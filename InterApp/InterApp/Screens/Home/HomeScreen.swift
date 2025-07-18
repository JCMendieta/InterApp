//
//  HomeScreen.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar Strings a archivo dedicado
//TODO: - Agregar manejo de estados a la vista
//TODO: - Agregar TextStyle
struct HomeScreen: View {
    @EnvironmentObject
    private var router: Router
    
    @StateObject private var viewModel = HomeScreenViewModel()
    
    //TODO: - Agregar campos de inicio de sesion
    var body: some View {
            ZStack {
                Color(Color.interDarkBlue)
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Text("Interrapidisimo app")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.interBoneWhite)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(UserDefaultsManager.user ?? "")
                        Text(UserDefaultsManager.name ?? "")
                        Text(UserDefaultsManager.identification ?? "")
                    }
                    .foregroundColor(Color.interBoneWhite)
                    .fontWeight(.semibold)
                    
                    InterButton(title: "Navegar a localidades") {
                        viewModel.navigateToLocalidades(router: router)
                    }

                    InterButton(title: "Navegar a tablas") {
                        viewModel.navigateToTablas(router: router)
                    }
                    
                    Spacer()
                    
                    if viewModel.versionStatus.shouldShowAlert {
                        Text(viewModel.versionStatus.alertMessage)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.interBoneWhite)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom)
                .alert("Error", isPresented: $viewModel.showErrorAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text(viewModel.errorMessage)
                        }
            }
            .onAppear {
                Task {
                    try await viewModel.authenticateUser(username: TestData.testUsername, password: TestData.testPassword)
                    await viewModel.checkAppVersion()
                }
            }
        }
}

#Preview {
    HomeScreen()
}
