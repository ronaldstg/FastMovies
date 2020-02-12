//
//  FastMoviesUnitTests.swift
//  FastMoviesUnitTests
//
//  Created by Ronald on 12/02/20.
//  Copyright © 2020 ronald. All rights reserved.
//

import XCTest
@testable import FastMovies

class FastMoviesUnitTests: XCTestCase {
        
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadingMovieDetailsShowMovieTitle() {

        let sb = UIStoryboard(name: "MovieDetails", bundle: nil)
        XCTAssertNotNil(sb, "Could not instantiate")
        let vc = sb.instantiateViewController(identifier: "MovieDetailsViewController") as MovieDetailsViewController
        vc.movieId = 448119
        XCTAssertNotNil(vc, "Could not instantiate")
        
        _ = vc.view
        
        let movieNameToTest = "Dolittle"
        let pred = NSPredicate(format: "text == %@", movieNameToTest)
        let exp = expectation(for: pred, evaluatedWith: vc.movieTitleLabel, handler: nil)
        let result = XCTWaiter.wait(for: [exp], timeout: 7.0)
        
        XCTAssert(result == XCTWaiter.Result.completed, "Show title for movieId not pass")
        
    }

}
