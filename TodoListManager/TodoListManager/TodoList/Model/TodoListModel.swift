//
//  TodoList.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

struct TodoList {

    var arrayTodo: [TodoElement]
    
    init() {
        arrayTodo = []
    }
    
    mutating func addElement(_ name:String) {
        let newElement: TodoElement = TodoElement(name)
        self.arrayTodo.append(newElement)
    }
    
    mutating func changeTodoElement( _ index: Int) {
        if arrayTodo.count > index {
            arrayTodo[index].changeTodoElement()
        } else {
            fatalError("Its not possible access Index of element not exist!")
        }
    }
    
    func getDoneTodoElement(_ index: Int) -> Bool {
        if arrayTodo.count > index {
            return arrayTodo[index].getDoneTodoElement()
        } else {
            fatalError("Its not possible access Index of element not exist!")
        }
    }
}

struct TodoElement {

    var name: String
    var done: Bool
    
    init(_ name: String) {
        self.name = name
        done = false
    }
    
    mutating func changeTodoElement() {
        done = !done
    }
    
    func getDoneTodoElement() -> Bool {
        return done
    }
}
