//
//  TestUITestsUITests.swift
//  TestUITestsUITests
//
//  Created by DSCO on 7/8/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import XCTest

class TestUITestsUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testSwiping() {
        app.launch()
        let isDisplayingOnboarding = app.otherElements["Onboarding View"].exists
        
        XCTAssertTrue(isDisplayingOnboarding)
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).value as! String, "January")
        app.swipeLeft()
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).value as! String, "February")
        app.swipeLeft()
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).value as! String, "March")
        app.terminate()
    }
    
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

}
