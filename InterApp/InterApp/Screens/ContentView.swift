//
//  ContentView.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            HomeScreen()
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
