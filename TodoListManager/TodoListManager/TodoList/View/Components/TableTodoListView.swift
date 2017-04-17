//
//  TableTodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import UIKit

struct StyleTableTodoListView {
    static let viewName:String = "TableTodoListView"
}

struct ClosureTableTodoListView {
    var numberPlans: (() -> Int)
    var customCell: ((TableTodoListViewCell, Int) -> Void)
}

class TableTodoListView: ComponentBaseView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var closures: ClosureTableTodoListView?
    
    // MARK: Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }
    
    override func initializeSubviews() {
        let viewName = StyleTableTodoListView.viewName
        viewLocal = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)![0] as? UIView
        viewLocal?.frame = self.bounds
    }
    
    fileprivate func registerNib() {
        let cellNib = TableTodoListViewCell.nibForCell()
        let cellIdentifier = StyleTableTodoListViewCell.cellIdentifier
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: Public API
    func configureView(_ closures: ClosureTableTodoListView) {
        self.closures = closures
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let closures = closures else {
            return 0
        }
        
        return closures.numberPlans()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = StyleTableTodoListViewCell.cellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TableTodoListViewCell
        
        if let closures = closures {
            closures.customCell(cell, indexPath.row)
        }
        
        return cell
    }
}
