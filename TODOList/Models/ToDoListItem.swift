//
//  ToDoListItem.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import Foundation
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool) {
        isDone = state
    }
}
