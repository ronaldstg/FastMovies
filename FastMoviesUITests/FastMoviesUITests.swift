//
//  FastMoviesUITests.swift
//  FastMoviesUITests
//
//  Created by Ronald on 04/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import XCTest

class FastMoviesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testMovieSelection() {
        let app = XCUIApplication()
        app.launch()
        

        let elementsQuery = app.scrollViews.otherElements
        let collectionViewsQuery = elementsQuery.collectionViews

        
        let firstChild = collectionViewsQuery.cells.children(matching: .other).element(boundBy: 0)
     
        let pred = NSPredicate(format: "exists == true")
        let exp = expectation(for: pred, evaluatedWith: firstChild, handler:nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 7.0)
        XCTAssert(res == XCTWaiter.Result.completed, "Failed time out waiting for movie cells")

        firstChild.tap()
        
    }
}
