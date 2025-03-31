//
//  UIButton+Extension.swift
//  TodoListCoreDataDemo
//
//  Created by Huei-Der Huang on 2025/3/28.
//

import Foundation
import UIKit

extension UIButton {
    func getConfiguration(image: UIImage?) -> UIButton.Configuration {
        if var configuration = self.configuration {
            configuration.image = image
            configuration.imagePadding = .zero
            configuration.imagePlacement = .all
            return configuration
        } else {
            var configuration = UIButton.Configuration.plain()
            configuration.image = image
            configuration.imagePadding = .zero
            configuration.imagePlacement = .all
            return configuration
        }
    }
}
