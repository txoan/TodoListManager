//
//  INSTodoListManager.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import Foundation

class INSTodoListManager {

    var todolist: TodoList = TodoList()
    
    //MARK: - public API
    func addNewTodoElement(_ name: String) {
        todolist.addElement(name)
    }
}
