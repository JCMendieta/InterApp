//
//  ContentView.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import SwiftUI

/// La vista principal de la aplicación que configura y gestiona el entorno de navegación.
struct ContentView: View {
    /// Router se inicializa una unica bvez y persiste durante ciclo de vida de
    /// ContentView.
    /// Es la fuente de verdad única para la navegación.
    @StateObject private var router = Router()
    
    var body: some View {
        /// El contenedor principal que gestiona la pila de navegación.
        NavigationStack(path: $router.path) {
            HomeScreen()
            /// Define el mapa de navegación para la aplicación.
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .localidades:
                        LocalidadesScreen()
                    case .tablas:
                        TablasScreen()
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
