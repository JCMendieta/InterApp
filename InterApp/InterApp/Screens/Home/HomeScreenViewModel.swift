//
//  HomeScreenViewModel.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import Foundation

final class HomeScreenViewModel: ObservableObject {
    func navigateToLocalidades(router: Router) {
        router.navigateTo(route: .localidades)
    }
    
    func navigateToTablas(router: Router) {
        router.navigateTo(route: .tablas)
    }
}
