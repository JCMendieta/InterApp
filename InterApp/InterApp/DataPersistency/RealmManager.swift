//
//  RealmManager.swift
//  InterApp
//
//  Created by Juan Camilo Mendieta Hernández on 16/07/25.
//

import RealmSwift

/// Gestor Singleton que simplifica las operaciones con la base de datos Realm.
final class RealmManager {
    static let shared = RealmManager()
    private var realm: Realm?
    
    private init() {
        do {
            self.realm = try Realm()
            print("Realm file location: \(realm?.configuration.fileURL?.absoluteString ?? "unknown")")
        } catch {
            print("Failed to initialize Realm \(error)")
            realm = nil
        }
    }
    
    /// Guarda una colección de objetos en Realm, con una política de actualización.
    /// - Parameters:
    ///   - objects: Los objetos a guardar.
    ///   - update: La política a seguir si los objetos ya existen (por defecto, `.all`).
    func saveObject<T: Object>(_ objects: [T], update: Realm.UpdatePolicy = .all) {
        do {
            try realm?.write {
                realm?.add(objects, update: update)
            }
        } catch {
            print("Error saving objects to Realm: \(error)")
        }
    }
    
    //TODO: - Manejar el opcional ( o propagar errores de persistencia )
    /// Recupera todos los objetos de un tipo específico desde Realm.
    /// - Parameter type: El tipo de objeto `Object` a recuperar.
    /// - Returns: Una colección `Results` opcional con los objetos encontrados.
    func fetchObjects<T: Object>(_ type: T.Type) -> Results<T>? {
        return realm?.objects(type)
    }
    
    /// Elimina todos los objetos de un tipo específico de la base de datos.
    /// - Parameter type: El tipo de objeto `Object` a eliminar.
    func deleteAll<T: Object>(_ type: T.Type) {
        do {
            guard let realm = realm else {
                print("Realm no está inicializado")
                return
            }
            
            try realm.write {
                let objects = realm.objects(type)
                realm.delete(objects)
            }
        } catch {
            print("Error deleting objects from Realm: \(error)")
        }
    }
}
