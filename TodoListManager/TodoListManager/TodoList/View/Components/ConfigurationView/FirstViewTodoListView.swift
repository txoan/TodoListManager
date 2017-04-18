//
//  FirstViewTodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 18/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import UIKit

struct StyleFirstViewTodoListView {
    static var viewName = "FirstViewTodoListView"
}

struct ClosureFirstViewTodoListView {
    var addElement: (() -> ())
    var sortedElements: (() -> ())
}

class FirstViewTodoListView: ComponentBaseView {

    
    //Elements hardCode in .Xib in View...
    @IBOutlet weak var btnSorted: UIButton!
    @IBOutlet weak var btnAddNewTodo: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    var closures: ClosureFirstViewTodoListView?
    
    // MARK: Cycle life
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func initializeSubviews() {
        let viewName = StyleFirstViewTodoListView.viewName
        viewLocal = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)![0] as? UIView
        viewLocal?.frame = self.bounds
    }
    
    @IBAction func actionSortedElements(_ sender: Any) {
        closures?.sortedElements()
    }
    
    @IBAction func actionBtnAddNewTodo(_ sender: Any) {
        closures?.addElement()
    }
    
    // MARK: Public API
    func configureView(_ closures: ClosureFirstViewTodoListView ) {
        self.closures = closures
    }
    
}
