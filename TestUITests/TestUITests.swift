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

    func testNavigation() {
        // 1 - Hit the back button on the collapset master view - this works regardless of device iPad or iPhone
        let masterButton = app.navigationBars.buttons.element(boundBy: 0)
        if masterButton.exists {
            masterButton.tap()
            print("BACK TAPPED")
        }
        // 1a - Or just use the line below to rotate the view to landscape which will automatically show the master view - uncomment the line below if you only need iPad specific testing
//        XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeRight
        
        let complaintsTable = app.tables["ComplaintsTableView"]
        XCTAssertTrue(complaintsTable.exists, "Table does not exist")
        let complaintCell = complaintsTable.cells.firstMatch
        XCTAssert(complaintCell.exists)
        complaintCell.tap()
        
        XCTAssert(self.app.navigationBars["Complaint #100"].exists)
        XCTAssertFalse(self.app.navigationBars["Complaint #99"].exists)
        
        let editButton = self.app.buttons["editComplaint"]
        XCTAssert(editButton.exists)
        editButton.tap()
        
        XCTAssert(self.app.navigationBars["Complaint #100"].exists)
        XCTAssertFalse(self.app.navigationBars["Complaint #99"].exists)
        
        let saveButton = self.app.buttons["Save"]
        XCTAssert(saveButton.exists)
        saveButton.tap()
        
        let okButton = self.app.buttons["Ok"]
        XCTAssert(okButton.exists)
        okButton.tap()
    }
}
