

//
//  TodoListManagerUITests.swift
//  TodoListManagerUITests
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import XCTest

class TodoListManagerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountCells () {
        let addNewTodoButton = XCUIApplication().buttons["Add new TODO"]
        addNewTodoButton.tap()
        addNewTodoButton.tap()
        addNewTodoButton.tap()
        addNewTodoButton.tap()
        XCTAssert(XCUIApplication().cells.count == 4)
        
    }
    
    func testChangeStateCellDoneAndReturnNotDone () {
        
        let app = XCUIApplication()
        app.buttons["Add new TODO"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.buttons["Not done"].tap()
        tablesQuery.buttons["Done"].tap()
        XCTAssert(app.tables.buttons["Done"].exists == false)
        XCTAssert( app.tables.buttons["Not done"].exists)
    }
    
    func testChangeCellToDoneAddOtherCell () {
        
        let app = XCUIApplication()
        let addNewTodoButton = app.buttons["Add new TODO"]
        addNewTodoButton.tap()
        let button1 = app.tables.buttons["Not done"]
        button1.tap()
        addNewTodoButton.tap()
        XCTAssert( app.tables.buttons["Done"].exists)
        XCTAssert( app.tables.buttons["Not done"].exists)
    }
    
}
