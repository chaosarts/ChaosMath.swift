//
//  ChaosVec4Test.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import XCTest
@testable import ChaosMath

class ChaosFuncTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRad () {
     	XCTAssertEqual(rad(90), Double.pi / 180 * 90)
    }
    
    func testDeg () {
        XCTAssertEqual(deg(Double.pi), 180)
    }
}
