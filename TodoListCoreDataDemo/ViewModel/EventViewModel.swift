//
//  EventViewModel.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import Combine

protocol EventViewModel {
    var event: PassthroughSubject<TaskRepositoryEvent, TaskRepositoryError> { get }
}
