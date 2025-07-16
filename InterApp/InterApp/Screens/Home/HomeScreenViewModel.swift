//
//  HomeScreenViewModel.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 15/07/25.
//

import Foundation

final class HomeScreenViewModel: ObservableObject {
    private let repository: RepositoryProtocol
    
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    @Published var versionStatus: VersionCheckResult = .upToDate
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
    }
    
    func navigateToLocalidades(router: Router) {
        router.navigateTo(route: .localidades)
    }
    
    func navigateToTablas(router: Router) {
        router.navigateTo(route: .tablas)
    }
    
    @MainActor
    func checkAppVersion() async {
        do {
            let serverVersionString = try await repository.fetchAppVersion()
            let currentVersionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
            
            compareVersions(appVersion: currentVersionString, serverVersion: serverVersionString)
        } catch {
            print("Error al verificar la versión: \(error)")
            versionStatus = .upToDate
        }
    }
    
    private func compareVersions(appVersion: String, serverVersion: String) {
        let comparisonResult = appVersion.compare(serverVersion, options: .numeric)
        
        switch comparisonResult {
        case .orderedSame:
            versionStatus = .upToDate
        case .orderedAscending:
            versionStatus = .updateAvailable
        case .orderedDescending:
            versionStatus = .newerThanRelease
        }
    }
    
    @MainActor
    func authenticateUser(username: String, password: String) async throws {
        do {
            let response = try await repository.authenticateUser(username: username, password: password)
            
            UserDefaultsManager.user = response.usuario
            UserDefaultsManager.identification = response.identificacion
            UserDefaultsManager.name = response.nombre
            
        } catch APIError.responseStatusNotSuccesful {
            errorMessage = "La autenticación falló. Por favor verifica tus credenciales."
            showErrorAlert = true
        } catch {
            print("hubo error \(error)")
        }
    }
}

enum VersionCheckResult {
    case upToDate
    case updateAvailable
    case newerThanRelease
    
    var alertMessage: String {
        switch self {
        case .upToDate:
            return "¡Tienes la versión más reciente de la aplicación!"
        case .updateAvailable:
            return "Hay una nueva versión disponible. Por favor actualiza la aplicación."
        case .newerThanRelease:
            return "Estás usando una versión más reciente que la versión de lanzamiento."
        }
    }
    
    var shouldShowAlert: Bool {
        switch self {
        case .upToDate:
            return false
        case .updateAvailable, .newerThanRelease:
            return true
        }
    }
}
