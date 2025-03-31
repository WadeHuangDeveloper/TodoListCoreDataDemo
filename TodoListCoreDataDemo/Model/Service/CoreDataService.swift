//
//  CoreDataService.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import Combine
import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    let event = PassthroughSubject<CoreDataServiceEvent, CoreDataServiceError>()
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init(container: NSPersistentContainer = NSPersistentContainer(name: "TodoListCoreDataDemo")) {
        self.container = container
        container.loadPersistentStores { [weak self] storeDescription, error in
            guard let self = self else { return }
            if let error = error {
                print("\(Self.self).\(#function) error: \(error.localizedDescription)")
                self.event.send(completion: .failure(.loadContainer(error)))
            } else {
                self.event.send(.loadContainer)
            }
        }
    }
    
    private func saveContext() throws {
        if context.hasChanges {
            do {
                try context.save()
                print("\(Self.self).\(#function) success")
                self.event.send(.saveContext)
            } catch {
                print("\(Self.self).\(#function) error: \(error.localizedDescription)")
                throw error
            }
        }
    }
    
    func read<T: NSManagedObject>(primaryKey: UUID) throws -> T? {
        do {
            guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
                throw NSError(domain: "\(Self.self)", code: 404, userInfo: [NSLocalizedDescriptionKey: "\(#function) failed"])
            }
            request.predicate = NSPredicate(format: "id == %@", primaryKey as CVarArg)
            let objects = try context.fetch(request)
            return objects.first
        } catch {
            print("\(Self.self).\(#function) error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func readAll<T: NSManagedObject>() throws -> [T] {
        do {
            guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
                throw NSError(domain: "\(Self.self)", code: 404, userInfo: [NSLocalizedDescriptionKey: "\(#function) failed"])
            }
            let objects = try context.fetch(request)
            return objects
        } catch {
            print("\(Self.self).\(#function) error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func create<T: NSManagedObject>(object: T) throws {
        do {
            context.insert(object)
            try saveContext()
        } catch {
            print("\(Self.self).\(#function) error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func update() throws {
        do {
            try saveContext()
        } catch {
            print("\(Self.self).\(#function) error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func delete<T: NSManagedObject>(type: T.Type, primaryKey: UUID) throws {
        do {
            guard let object: T = try read(primaryKey: primaryKey) else {
                throw NSError(domain: "\(Self.self)", code: 404, userInfo: [NSLocalizedDescriptionKey: "\(#function) failed"])
            }
            context.delete(object)
            try saveContext()
        } catch {
            print("\(Self.self).\(#function) error: \(error.localizedDescription)")
            throw error
        }
    }
}
