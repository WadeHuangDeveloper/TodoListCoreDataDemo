//
//  TaskModel.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation

class TaskModel {
    let object: TaskEntity
    
    init(object: TaskEntity) {
        self.object = object
    }
    
    static func ConvertObjectsToModels(_ objects: [TaskEntity]) -> [TaskModel] {
        return objects.map { TaskModel(object: $0) }
    }
}
