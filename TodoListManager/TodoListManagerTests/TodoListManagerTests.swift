//
//  TodoListManagerTests.swift
//  TodoListManagerTests
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import XCTest
@testable import TodoListManager

class TodoListManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testManagerAddNewTodoElement() {
        // Is a Singleton.
        let manager: TodoListManager = TodoListManager()
        let before = manager.todolist.getCount()
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        let after = manager.todolist.getCount()
        XCTAssert(before < after)
        XCTAssert((before + 1) == after)
    }
    
    func testManagerCountTodoElement() {
        let manager: TodoListManager = TodoListManager()
        let num = manager.countTodoElement()
        XCTAssert(num == 0)
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        manager.addNewTodoElement(pruebaName)
        manager.addNewTodoElement(pruebaName)

        let newNum = manager.countTodoElement()
        XCTAssert(newNum == 3)
    }
    
    func testChangeStateElementTodoList() {
        let manager: TodoListManager = TodoListManager()
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        manager.todolist.changeTodoElement(0)
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .done)
    }
    
    func testChangeStateElementTodoListTwice() {
        let manager: TodoListManager = TodoListManager()
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        manager.todolist.changeTodoElement(0)
        manager.todolist.changeTodoElement(0)
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
    }

    func testChangeStateElementTodoListOdd() {
        let manager: TodoListManager = TodoListManager()
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        for _ in 0...10 {
            manager.todolist.changeTodoElement(0)
        }
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .done)
    }

    func testChangeStateElementTodoListPairs() {
        let manager: TodoListManager = TodoListManager()
        let pruebaName: String = "Name"
        manager.addNewTodoElement(pruebaName)
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        for _ in 0...9 {
            manager.todolist.changeTodoElement(0)
        }
        
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
    }
    
    func testSortArrayTodoElements () {
        var list: TodoList = TodoList()
        let arraySorted = ["A","B", "C", "D"]
        list.addElement("B")
        list.addElement("D")
        list.addElement("C")
        list.addElement("A")
        list.sortByNameTodoList()
        XCTAssert(list.getNameForIndex(0) == arraySorted[0])
        XCTAssert(list.getNameForIndex(1) == arraySorted[1])
        XCTAssert(list.getNameForIndex(2) == arraySorted[2])
        XCTAssert(list.getNameForIndex(3) == arraySorted[3])
    }
}
