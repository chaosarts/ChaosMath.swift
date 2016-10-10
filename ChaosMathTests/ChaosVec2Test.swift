//
//  ChaosMathTests.swift
//  ChaosMathTests
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import XCTest
@testable import ChaosMath

class ChaosVec2Test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        /// Initialization
        let v10: vec2f = vec2f(1, 2)
        let v11: vec2f = vec2f(1)
        let v12: vec2f = vec2f()
        let v13: vec2f = vec2f(v10)
        
        let v20: vec2f = [2, -2]
        let v21: vec2f = []
        let v22: vec2f = [9]
        let v23: vec2f = [7, 3, 5]
        
        let e1: vec2f = vec2f.e1
        let e2: vec2f = vec2f.e2
        let length_v10 : Float = sqrt(5);
        
        /// Properties
        XCTAssertEqual(v10.x, 1)
        XCTAssertEqual(v10.y, 2)
        XCTAssertEqual(v12.x, 0)
        XCTAssertEqual(v12.y, 0)
        XCTAssertEqual(v21.x, 0)
        XCTAssertEqual(v21.y, 0)
        XCTAssertEqual(v22.x, 9)
        XCTAssertEqual(v22.y, 0)
        XCTAssertEqual(v23.x, 7)
        XCTAssertEqual(v23.y, 3)
        XCTAssertEqual(v10, v13)
        XCTAssertEqual(e1, vec2f(1, 0))
        XCTAssertEqual(e2, vec2f(0, 1))
        XCTAssertEqual(v11.array, [1, 1])
        XCTAssertEqual(v21.array.count, 2)
        XCTAssertEqual(v22.array.count, 2)
        XCTAssertEqual(v23.array.count, 2)
        
        /// Operator
        XCTAssertEqual(-v20, vec2f(-2, 2))
        XCTAssertEqual(v10 + v11, vec2f(2, 3))
        XCTAssertEqual(v10 - v11, vec2f(0, 1))
        XCTAssertEqual(v10 * v20, vec2f(2, -4))
        XCTAssertEqual(v23 * 2, vec2f(14, 6))
        XCTAssertEqual(4 * v22, vec2f(36, 0))
        XCTAssertEqual(v22 / 3, vec2f(3, 0))
        
        var x : vec2f = vec2f(2, -3)
        
        x += e1 * 2
        XCTAssertEqual(x, vec2f(4, -3))
        
        x -= e2
        XCTAssertEqual(x, vec2f(4, -4))
        
        x *= 5
        XCTAssertEqual(x, vec2f(20, -20))
        
        x /= 10
        XCTAssertEqual(x, vec2f(2, -2))
        
        XCTAssertTrue(x == v20)
        XCTAssertTrue(x != v21)
        
        
        /// Functions
        XCTAssertEqual(dot(v23, v20), 8)
        XCTAssertEqual(determinant(v23, v20), -20)
        XCTAssertEqual(magnitude(v23), sqrt(7 * 7 + 3 * 3))
        XCTAssertEqual(normalize(v10), vec2f(1 / length_v10, 2 / length_v10))
        XCTAssert(abs(magnitude(normalize(v10)) - 1) < 0.000001)
        XCTAssertEqual(angle(e1, e2), Float(M_PI / 2))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
