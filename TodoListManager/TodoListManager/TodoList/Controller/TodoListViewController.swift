//
//  TodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 17/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

//import Foundation
import UIKit



class TodoListViewController: UIViewController {
    
    var manager: TodoListManager = TodoListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }
    
    override func loadView() {
        super.loadView()
        view = loadViewFromXibFile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private methods
    fileprivate func loadViewFromXibFile() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let viewName = StyleTodoListView.viewName
        let nib = UINib(nibName: viewName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func configurationView(){
        configurationTableTodoListView()
        configurationFirstViewTodoListView()
    }
    
    func configurationTableTodoListView(){
        weak var weakSelf = self
        let closure = ClosureTableTodoListView(numberPlans: { () -> Int in
            guard let number = weakSelf?.manager.countTodoElement() else {
                return 0
            }
            return number
            
        }) { (cell, index) in
            let closure = ClosureTableTodoListViewCell(changeStateTodoElement: { (state) in
                weakSelf?.manager.changeStateElementTodoListForIndex(index)
            })
            weakSelf?.manager.customCell(cell, index, closure)
        }
        
        (view as! TodoListView).configureTableView(closure)
    }
    
    func configurationFirstViewTodoListView() {
        weak var weakSelf = self
        let closure = ClosureFirstViewTodoListView {
            weakSelf?.manager.addNewTodoElement()
            (weakSelf?.view as! TodoListView).reloadTable()
        }

        (view as! TodoListView).configurationFirstView(closure)
    }
    
    
}
