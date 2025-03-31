//
//  TaskRepositoryEvent.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation

enum TaskRepositoryEvent {
    case read(TaskEntity)
    case readAll([TaskEntity])
    case create(TaskEntity)
    case update(TaskEntity)
    case delete(TaskEntity)
}

enum TaskRepositoryError: Error {
    case coreData(Error)
    case readAll(Error)
    case create(Error)
    case update(Error)
    case delete(Error)
}
