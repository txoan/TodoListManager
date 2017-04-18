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
        manager.addNewTodoElement()
        let after = manager.todolist.getCount()
        XCTAssert(before < after)
        XCTAssert((before + 1) == after)
    }
    
    func testManagerCountTodoElement() {
        let manager: TodoListManager = TodoListManager()
        let num = manager.countTodoElement()
        XCTAssert(num == 0)
        
        manager.addNewTodoElement()
        manager.addNewTodoElement()
        manager.addNewTodoElement()

        let newNum = manager.countTodoElement()
        XCTAssert(newNum == 3)
    }
    
    func testChangeStateElementTodoList() {
        let manager: TodoListManager = TodoListManager()
        manager.addNewTodoElement()
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        manager.todolist.changeTodoElement(0)
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .done)
    }
    
    func testChangeStateElementTodoListTwice() {
        let manager: TodoListManager = TodoListManager()
        manager.addNewTodoElement()
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        manager.todolist.changeTodoElement(0)
        manager.todolist.changeTodoElement(0)
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
    }

    func testChangeStateElementTodoListOdd() {
        let manager: TodoListManager = TodoListManager()
        manager.addNewTodoElement()
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
        manager.addNewTodoElement()
        var data: DataTableTodoListViewCell = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
        for _ in 0...9 {
            manager.todolist.changeTodoElement(0)
        }
        
        data = manager.todolist.getInfoForCell(0)
        XCTAssert(data.state == .notDone)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
