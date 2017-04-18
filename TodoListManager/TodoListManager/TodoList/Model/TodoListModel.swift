//
//  TodoListModel.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import Foundation

struct TodoList {
    
    private var arrayTodo: [TodoElement]
    
    init() {
        arrayTodo = []
    }
    
    // MARK: Public API
    mutating func addElement(_ name:String) {
        let newElement: TodoElement = TodoElement(name)
        self.arrayTodo.append(newElement)
    }
    
    mutating func changeTodoElement( _ index: Int) {
        guard arrayTodo.count > index  else {
            fatalError("Its not possible access Index of element not exist!")
        }
        arrayTodo[index].changeTodoElement()
    }
    
    func getCount() -> Int {
        return arrayTodo.count
    }
    
    func getInfoForCell(_ index: Int ) -> DataTableTodoListViewCell {
        let name = getNameForIndex(index)
        let state = getStateElement(index)
        
        return DataTableTodoListViewCell(name: name, state: state)
    }
    
    mutating func sortByNameTodoList() {
       let sortedArray = arrayTodo.sorted(by: { $0.getName() < $1.getName() })
       arrayTodo = sortedArray
    }
    
    // MARK: Private API
    func getNameForIndex(_ index: Int) -> String {
        guard arrayTodo.count > index  else {
            fatalError("Not exist index in array!")
        }
        
        return arrayTodo[index].getName()
    }
    
    private func getStateElement(_ index: Int) -> StateTodo {
        let stateBool = getDoneTodoElement(index)
        if  stateBool {
            return StateTodo.done
        }
        return StateTodo.notDone
    }
    
    private func getDoneTodoElement(_ index: Int) -> Bool {
        guard arrayTodo.count > index  else {
            fatalError("Its not possible access Index of element not exist!")
        }
        return arrayTodo[index].getDoneTodoElement()
    }
    
}

struct TodoElement {
    
    private var name: String
    private var identifier: String
    private var done: Bool
    
    init(_ name: String) {
        self.name = name
        self.identifier = NSUUID().uuidString
        done = false
    }
    
    mutating func changeTodoElement() {
        done = !done
    }
    
    func getDoneTodoElement() -> Bool {
        return done
    }
    
    func getName() -> String {
        return name
    }
}
