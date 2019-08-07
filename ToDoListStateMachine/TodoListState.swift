//
//  TodoListState.swift
//  ToDoListStateMachine
//
//  Created by Yani Buchkov on 7.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import Foundation


enum TodoListState {
    
    // States
    case loading
    case hasItems(items: [ToDoItem])
    case hasNoItems
    case hasError(error: Error)
    
    // Signals - input of the state machine
    func numberOfItems() -> Int {
        switch self {
        case .loading, .hasNoItems, .hasError:
            return 0
        case .hasItems(let items):
            return items.count
        }
    }
    
    func item(for indexPath: IndexPath) -> ToDoItem? {
        guard case let .hasItems(items) = self else {
            return nil
        }
        
        return items[indexPath.row]
    }
    
    // Transiotions
    /// Mutating function to change the enum itself
    mutating func taskFinished(items: [ToDoItem]?, error: Error?) {
        
        if let error = error {
            self = .hasError(error: error)
        }
        
        if let items = items, items.count > 0 {
            self = .hasItems(items: items)
        } else {
            self = .hasNoItems
        }
    }
}
