

//
//  TodoListManagerUITests.swift
//  TodoListManagerUITests
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import XCTest

struct stringTest {
    static let textA = "Awqerqwerqweqw"
    static let textX = "Xqwerqwerqw"
    static let textD = "Dwqrqwerwq"
    static let textB = "Bqwerqwerqwe"
}

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
    
    func testAddOneElement() {
        
        let app = XCUIApplication()
        addElement(app)
        XCTAssert(XCUIApplication().cells.count == 1)
        
    }
    
    func testCancelAddOneElement() {
        
        let app = XCUIApplication()
        app.buttons["Add new TODO"].tap()
        app.alerts["New TODO!"].buttons["Cancel"].tap()
        XCTAssert(XCUIApplication().cells.count == 0)
    }
    
    func testAdd4Elements() {
        
        let app = XCUIApplication()
        add4Elements(app)
        XCTAssert(XCUIApplication().cells.count == 4)
    }
    
    func testChangeToDone() {
        
        let app = XCUIApplication()
        addElement(app)
        
        app.tables.buttons["Not done"].tap()
        
        XCTAssert( app.tables.buttons["Not done"].exists == false)
        XCTAssert( app.tables.buttons["Done"].exists)
        
    }
    
    func testChangeToDoneToNotDone() {
        let app = XCUIApplication()
        addElement(app)
        
        app.tables.buttons["Not done"].tap()
        app.tables.buttons["Done"].tap()
        
        XCTAssert( app.tables.buttons["Not done"].exists)
        XCTAssert( app.tables.buttons["Done"].exists == false)
        
    }
    
    func testAddElementChangeDone() {
        let app = XCUIApplication()
        addElement(app)
        app.tables.buttons["Not done"].tap()
        addElement(app)
        XCTAssert( app.tables.buttons["Not done"].exists)
        XCTAssert( app.tables.buttons["Done"].exists)
    }
    
    func testSort4Elements() {
        let app = XCUIApplication()
        add4Elements(app)
        app.buttons["Sorted"].tap()
        let table = app.tables.element(boundBy: 0)
        let cell = table.cells.element(boundBy: 0)
        let cell1 = table.cells.element(boundBy: 1)
        let cell2 = table.cells.element(boundBy: 2)
        let cell3 = table.cells.element(boundBy: 3)
        
        XCTAssert((cell.staticTexts[stringTest.textA]).exists)
        XCTAssert((cell1.staticTexts[stringTest.textB]).exists)
        XCTAssert((cell2.staticTexts[stringTest.textD]).exists)
        XCTAssert((cell3.staticTexts[stringTest.textX]).exists)
        
    }
    
    private func addElement(_ app: XCUIApplication) {
        
        app.buttons["Add new TODO"].tap()
        
        let newTodoAlert = app.alerts["New TODO!"]
        newTodoAlert.collectionViews.textFields["Description"].typeText(stringTest.textA)
        newTodoAlert.buttons["Confirm"].tap()
    }

    private func add4Elements(_ app: XCUIApplication) {
        let addNewTodoButton = app.buttons["Add new TODO"]
        addNewTodoButton.tap()
        
        let newTodoAlert = app.alerts["New TODO!"]
        let descriptionTextField = newTodoAlert.collectionViews.textFields["Description"]
        descriptionTextField.typeText(stringTest.textA)
        
        let confirmButton = newTodoAlert.buttons["Confirm"]
        confirmButton.tap()
        addNewTodoButton.tap()
        descriptionTextField.typeText(stringTest.textX)
        confirmButton.tap()
        addNewTodoButton.tap()
        descriptionTextField.typeText(stringTest.textD)
        confirmButton.tap()
        addNewTodoButton.tap()
        descriptionTextField.typeText(stringTest.textB)
        confirmButton.tap()
    }
}
