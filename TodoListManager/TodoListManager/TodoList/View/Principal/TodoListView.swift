//
//  TodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import UIKit

struct StyleTodoListView {
    static let viewName: String = "TodoListView"
}

class TodoListView: UIView {
    
    @IBOutlet weak var tableTodoListView: TableTodoListView!
    
    // MARK: Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Public API
    func configureTableView(_ closures: ClosureTableTodoListView) {
        tableTodoListView.configureView(closures)
    }
}
