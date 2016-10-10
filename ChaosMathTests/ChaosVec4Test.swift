//
//  ChaosVec4Test.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import XCTest
@testable import ChaosMath

class ChaosVec4Test: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        XCTAssertEqual(vec4f.e1, vec4f(1, 0, 0, 0))
        XCTAssertEqual(vec4f.e2, vec4f(0, 1, 0, 0))
        XCTAssertEqual(vec4f.e3, vec4f(0, 0, 1, 0))
        XCTAssertEqual(vec4f.e4, vec4f(0, 0, 0, 1))
        XCTAssertEqual(vec4f.e4.w, 1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
