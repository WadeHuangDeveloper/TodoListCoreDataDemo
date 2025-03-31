//
//  TaskEntity+CoreDataProperties.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/30.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var createTimestamp: Date?
    @NSManaged public var finishTimestamp: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var title: String?
    
    public var unwrappedID: UUID {
        return id ?? UUID()
    }
    
    public var unwrappedCreateTimestamp: Date {
        return createTimestamp ?? .now
    }
    
    public var unwrappedFinishTimestamp: Date? {
        return finishTimestamp
    }
    
    public var unwrappedIsDone: Bool {
        return isDone
    }
    
    public var unwrappedTitle: String {
        return title ?? ""
    }
}

extension TaskEntity : Identifiable {

}
