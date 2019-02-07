//
//  KeyPathTests.swift
//  KeyPathTests
//
//  Created by user on 1/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import XCTest

class KeyPathTests: XCTestCase {

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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testWage() {
        XCTAssert(Wage.hours(forWage: 50, withPrice: 200) == 4)
        XCTAssert(Wage.hours(forWage: 15.5, withPrice: 250.53) == 17)
    }
    
    
}

























