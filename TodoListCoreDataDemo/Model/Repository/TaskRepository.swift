//
//  TaskRepository.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import Combine

class TaskRepository: TaskRepositoryProtocol {
    private var cancellables = Set<AnyCancellable>()
    let event = PassthroughSubject<TaskRepositoryEvent, TaskRepositoryError>()
    
    init() {
        CoreDataService.shared.event
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.event.send(completion: .failure(.coreData(error)))
                }
            }, receiveValue: { event in
                switch event {
                case .loadContainer:
                    break
                case .saveContext:
                    break
                }
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func read(task: TaskEntity) throws -> TaskEntity? {
        do {
            let task: TaskEntity? = try CoreDataService.shared.read(primaryKey: task.unwrappedID)
            return task
        } catch {
            throw error
        }
    }
    
    func readAll() throws -> [TaskEntity] {
        do {
            var tasks: [TaskEntity] = try CoreDataService.shared.readAll()
            tasks = tasks.sorted { $0.unwrappedCreateTimestamp > $1.unwrappedCreateTimestamp }
            return tasks
        } catch {
            throw error
        }
    }
    
    func create(title: String) throws {
        do {
            let task = TaskEntity(context: CoreDataService.shared.context, title: title)
            print("\(Self.self).\(#function) \(task)")
            try CoreDataService.shared.create(object: task)
        } catch {
            throw error
        }
    }
    
    func update(task: TaskEntity, title: String? = nil, isDone: Bool? = nil) throws {
        do {
            task.update(title: title, isDone: isDone)
            try CoreDataService.shared.update()
        } catch {
            throw error
        }
    }
    
    func delete(task: TaskEntity) throws {
        do {
            try CoreDataService.shared.delete(type: TaskEntity.self, primaryKey: task.unwrappedID)
        } catch {
            throw error
        }
    }
}
