//
//  HomeScreen.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

//TODO: - Agregar Strings a archivo dedicado
//TODO: - Agregar manejo de estados a la vista
struct HomeScreen: View {
    @EnvironmentObject
    private var router: Router
    
    @StateObject private var viewModel = HomeScreenViewModel()
    
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

                    InterButton(title: "Navegar a localidades") {
                        viewModel.navigateToLocalidades(router: router)
                    }

                    InterButton(title: "Navegar a tablas") {
                        viewModel.navigateToTablas(router: router)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
            }
        }
}

#Preview {
    HomeScreen()
}
