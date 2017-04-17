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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}
