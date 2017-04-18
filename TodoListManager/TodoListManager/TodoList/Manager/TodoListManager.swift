//
//  INSTodoListManager.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import Foundation

class TodoListManager {

    var todolist: TodoList = TodoList()
    
    //MARK: - public API
    func addNewTodoElement() {
        let name = "\(todolist.getCount() + 1)"
        todolist.addElement(name)
    }
    
    func countTodoElement() -> Int {
        return todolist.getCount()
    }
    
    func getInfoCellForIndex (_ index: Int) -> DataTableTodoListViewCell {
        return todolist.getInfoForCell(index)
    }
    
    func customCell(_ cell: TableTodoListViewCell,
                    _ index: Int,
                    _ closure: ClosureTableTodoListViewCell) {
        
        let info = getInfoCellForIndex(index)
        
        cell.configureCell(info, closures: closure)
    }
    
    func changeStateElementTodoListForIndex(_ index: Int) {
        todolist.changeTodoElement(index)
    }
}
