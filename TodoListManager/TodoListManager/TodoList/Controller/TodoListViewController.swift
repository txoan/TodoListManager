//
//  TodoListView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 17/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

//import Foundation
import UIKit

struct StyleTodoListVC {
    static let titleAlert = "New TODO!"
    static let descriptionAlert = "Please input description:"
    static let placeHolderAlert = "Description"
    static let confirmAlert = "Confirm"
    static let cancelAlert = "Cancel"
}

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
            let closure = ClosureTableTodoListViewCell(changeStateTodoElement: { () in
                weakSelf?.manager.changeStateElementTodoListForIndex(index)
            })
            weakSelf?.manager.customCell(cell, index, closure)
        }
        
        (view as! TodoListView).configureTableView(closure)
    }
    
    func configurationFirstViewTodoListView() {
        weak var weakSelf = self
        let closure = ClosureFirstViewTodoListView(addElement: { 
            weakSelf?.presentAlert()
        }) { 
            weakSelf?.sortedElementsAndReload()
        }

        (view as! TodoListView).configurationFirstView(closure)
    }
    
    func presentAlert() {
        let alertController = UIAlertController(title: StyleTodoListVC.titleAlert,
                                                message: StyleTodoListVC.descriptionAlert,
                                                preferredStyle: .alert)
        weak var weakSelf = self
        let confirmAction = UIAlertAction(title: StyleTodoListVC.confirmAlert,
                                          style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                if let name = field.text {
                    weakSelf?.addElementAndReload(name)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: StyleTodoListVC.cancelAlert,
                                         style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func addElementAndReload(_ name: String) {
        manager.addNewTodoElement(name)
        (self.view as! TodoListView).reloadTable()
    }
    
    private func sortedElementsAndReload() {
        manager.sortedElements()
        (self.view as! TodoListView).reloadTable()
    }
    
}
