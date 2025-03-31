//
//  CoreDataServiceEvent.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation

enum CoreDataServiceEvent {
    case loadContainer
    case saveContext
}


enum CoreDataServiceError: Error {
    case loadContainer(Error)
    case saveContext(Error)
}
