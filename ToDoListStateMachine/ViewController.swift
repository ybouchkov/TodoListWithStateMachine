//
//  ViewController.swift
//  ToDoListStateMachine
//
//  Created by Yani Buchkov on 6.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    var state: TodoListState = .loading {
        didSet {
            switch state {
            case .loading:
                showActivityIndicator()
            case .hasNoItems:
                showBackgroundLabel(messge: "No items found")
            case .hasItems(_):
                self.tableView.backgroundView = nil
                tableView.separatorStyle = .singleLine
            case .hasError(let error):
                showBackgroundLabel(messge: "Error loading items: \(error)")
            }
            
            self.tableView.reloadData()
        }
    }
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }
    
    private func getItems() {
        state = .loading
        ToDoItem.fetchItems { [unowned self] (items, error) in
            state.taskFinished(items: items, error: error) // this will transiotions us to correct state
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        if let toDoItem = state.item(for: indexPath) {
            cell.textLabel?.text = toDoItem.title
            cell.detailTextLabel?.text = toDoItem.priority
        }
        return cell
    }
    
    // MARK: - Helpers
    
    private func showActivityIndicator() {
        // TODO: Implement
    }
    
    private func showBackgroundLabel(messge: String) {
        // TODO: Implement
    }
}

