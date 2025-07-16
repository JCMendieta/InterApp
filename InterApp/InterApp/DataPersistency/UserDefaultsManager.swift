//
//  UserDefaultsManager.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import Foundation

enum UserDefaultsKey: String {
    case usuario
    case identificacion
    case nombre
}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefaults: UserDefaults
    
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    /// Guarda un valor para una clave específica. Si el valor es `nil`, elimina la clave.
    /// - Parameters:
    ///   - value: El valor genérico a guardar.
    ///   - key: La clave donde se guardará el valor.
    func setValue<T>(_ value: T?, forKey key: UserDefaultsKey) {
        if value == nil {
            userDefaults.removeObject(forKey: key.rawValue)
        } else {
            userDefaults.set(value, forKey: key.rawValue)
        }
    }
    
    /// Obtiene un valor opcional para una clave específica.
    /// - Parameter key: La clave del valor a obtener.
    /// - Returns: El valor de tipo `T` o `nil` si no existe.
    func getValue<T>(forKey key: UserDefaultsKey) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
    }
    
    /// Verifica si existe un valor para la clave especificada.
    /// - Parameter key: La clave a verificar.
    /// - Returns: `true` si existe un valor, de lo contrario `false`.
    func hasValue(forKey key: UserDefaultsKey) -> Bool {
        return userDefaults.object(forKey: key.rawValue) != nil
    }
    
    /// Elimina el valor para una clave específica.
    /// - Parameter key: La clave del valor a eliminar.
    func removeValue(forKey key: UserDefaultsKey) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

extension UserDefaultsManager {
    static var user: String? {
        get { shared.getValue(forKey: .usuario) }
        set { shared.setValue(newValue, forKey: .usuario) }
    }
    
    static var identification: String? {
        get { shared.getValue(forKey: .identificacion) }
        set { shared.setValue(newValue, forKey: .identificacion) }
    }
    
    static var name: String? {
        get { shared.getValue(forKey: .nombre) }
        set { shared.setValue(newValue, forKey: .nombre) }
    }
}
