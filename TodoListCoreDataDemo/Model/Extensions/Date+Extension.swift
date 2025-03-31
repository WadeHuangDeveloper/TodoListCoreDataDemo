//
//  Date+Extension.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation

extension Date {
    func toDateTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
