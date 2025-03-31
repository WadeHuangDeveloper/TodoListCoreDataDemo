//
//  TaskCreateViewControllerViewModel.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import Combine

class TaskCreateViewControllerViewModel: EventViewModel {
    var event = PassthroughSubject<TaskRepositoryEvent, TaskRepositoryError>()
    let repository: TaskRepositoryProtocol
    
    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }
    
    func create(title: String) {
        do {
            try repository.create(title: title)
            if let task = try repository.readAll().first {
                print("\(Self.self).\(#function) \(task)")
                event.send(.create(task))
            } else {
                throw NSError(domain: "\(Self.self)", code: 404, userInfo: [NSLocalizedDescriptionKey: "\(#function) failed"])
            }
        } catch {
            event.send(completion: .failure(.create(error)))
        }
    }
}
