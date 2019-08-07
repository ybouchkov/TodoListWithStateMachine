//
//  ToDoItem.swift
//  ToDoListStateMachine
//
//  Created by Yani Buchkov on 6.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import Foundation

final class ToDoItem {

    var title: String
    var priority: String
    
    init(title: String, priority: String) {
        self.title = title
        self.priority = priority
    }
    
    static func fetchItems(items: ([ToDoItem], Error?) -> Void) {
        let itemsToReturn: [ToDoItem] = [
            ToDoItem(title: "Get milk", priority: "Hight"),
            ToDoItem(title: "Walk the dog", priority: "Medium"),
            ToDoItem(title: "Clean the gutters", priority: "Low")
        ]
        items(itemsToReturn, nil)
    }
}
