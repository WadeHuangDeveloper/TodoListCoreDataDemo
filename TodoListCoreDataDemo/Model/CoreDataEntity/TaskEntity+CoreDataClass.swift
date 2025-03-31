//
//  TaskEntity+CoreDataClass.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/30.
//
//

import Foundation
import CoreData

@objc(TaskEntity)
public class TaskEntity: NSManagedObject {
    convenience init(context: NSManagedObjectContext, title: String, isDone: Bool? = false) {
        self.init(context: context)
        
        self.id = UUID()
        self.title = title
        self.isDone = isDone ?? false
        self.createTimestamp = .now
        self.finishTimestamp = nil
    }
    
    public func update(title: String? = nil, isDone: Bool? = nil) {
        if let title = title {
            self.title = title
        }
        if self.isDone == false && isDone == true {
            
        }
        if let isDone = isDone {
            if self.isDone == false && isDone == true {
                self.finishTimestamp = .now
            } else if self.isDone == true && isDone == false {
                self.finishTimestamp = nil
            }
            self.isDone = isDone
        }
    }
}
