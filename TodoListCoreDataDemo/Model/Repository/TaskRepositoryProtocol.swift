//
//  TaskRepositoryProtocol.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation

protocol TaskRepositoryProtocol {
    func read(task: TaskEntity) throws -> TaskEntity?
    func readAll() throws -> [TaskEntity]
    func create(title: String) throws
    func update(task: TaskEntity, title: String?, isDone: Bool?) throws
    func delete(task: TaskEntity) throws
}
