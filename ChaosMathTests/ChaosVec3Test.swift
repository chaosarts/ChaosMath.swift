//
//  ChaosVec3Test.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import XCTest
@testable import ChaosMath

class ChaosVec3Test: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let v10 : vec3f = vec3f()
        let v11 : vec3f = vec3f(1)
        let v12 : vec3f = vec3f(3, -2, 1)
        
        let v20 : vec3f = vec3f(vec2f(2, 1), -4)
        let v21 : vec3f = vec3f(1, vec2f(2, 1))
        
        XCTAssertEqual(v10.x, 0)
        XCTAssertEqual(v10.y, 0)
        XCTAssertEqual(v10.z, 0)
        XCTAssertEqual(v11.array, [1, 1, 1])
        XCTAssertEqual(v12.array, [3, -2, 1])
        
        XCTAssertEqual(v20, vec3f(2, 1, -4))
        XCTAssertEqual((-v21).array, [-1, -2, -1])
        XCTAssertEqual(v20 + v21, vec3f(3, 3, -3))
        XCTAssertEqual(v20 - v21, vec3f(1, -1, -5))
        XCTAssertEqual(v20 * v21, vec3f(2, 2, -4))
        XCTAssertEqual(v20 * 2, vec3f(4, 2, -8))
        
        XCTAssertEqual(dot(vec3f.e1, vec3f.e2), 0)
        XCTAssertEqual(dot(cross(v11, v12), v11), 0)
        XCTAssertEqual(cross(vec3f.e1, vec3f.e2), vec3f.e3)
        XCTAssertEqual(normalize(v12), v12 / sqrt(14))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
