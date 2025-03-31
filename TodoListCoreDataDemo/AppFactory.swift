//
//  AppFactory.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import UIKit

struct AppFactory {
    static func makeRootViewController() -> UIViewController {
        let repository = TaskRepository()
        let viewModel = TaskListViewControllerViewModel(repository: repository)
        let viewController = TaskListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
