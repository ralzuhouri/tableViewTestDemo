//
//  TestUITests.swift
//  TestUITests
//
//  Created by Ramy Al Zuhouri on 24/10/19.
//  Copyright © 2019 Ramy Al Zuhouri. All rights reserved.
//

import XCTest

class TestUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.app = XCUIApplication()
        self.app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let table = self.app.tables["TableView"]
        XCTAssert(table.waitForExistence(timeout: 5.0))
    }

}
