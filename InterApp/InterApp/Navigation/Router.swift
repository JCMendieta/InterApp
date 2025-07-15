//
//  Router.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

/// Protocolo para crear un Router que gestiona la navegación de la app.
protocol RouterProtocol {
    /// Navega a una nueva pantalla (ruta) apilándola sobre la actual.
    /// - Parameter route: El destino al que se desea navegar.
    func navigateTo(route: Route)
    /// Navega hacia atrás, eliminando la pantalla actual de la pila de navegación.
    func navigateBack()
    /// Regresa a la pantalla inicial, eliminando todas las pantallas de la pila de navegación.
    func navigateToStart()
}

final class Router: RouterProtocol, ObservableObject {
    /// La pila de navegación que almacena la secuencia de rutas activas.
    @Published var path = NavigationPath()
    
    func navigateTo(route: Route) {
        path.append(route)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToStart() {
        path.removeLast(path.count)
    }
}
