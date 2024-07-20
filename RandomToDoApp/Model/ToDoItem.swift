//
//  ToDoItem.swift
//  RandomToDoApp
//
//  Created by 白石友樹 on 2024/07/17.
//

import Foundation
import UIKit

struct ToDoItem {
    var title: String
    var date: Date
    var priority: Int
    var isCompleted: Bool
    var color: UIColor {
        if isCompleted {
            return UIColor.gray
        } else {
            switch priority {
            case 1:
                return UIColor.red
            case 2:
                return UIColor.orange
            default:
                return UIColor.blue
            }
        }
    }
}

