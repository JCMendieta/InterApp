//
//  Router.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import SwiftUI

protocol RouterProtocol {
    func navigateTo(route: Route)
    func navigateBack()
    func navigateToStart()
}

final class Router: RouterProtocol, ObservableObject {
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
