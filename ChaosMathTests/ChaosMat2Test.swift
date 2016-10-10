//
//  ChaosMat2Test.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import XCTest
@testable import ChaosMath

class ChaosMat2Test: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let mat01 : mat2f = mat2f(1)
        let mat02 : mat2f = mat2f(0, -1, 2, 0)
        
        XCTAssertEqual(mat01.array, [1, 0, 0, 1])
        XCTAssertEqual(mat01 * mat02, mat02)
        XCTAssertEqual(mat02 * 2, mat2f(0, -2, 4, 0))
        XCTAssertEqual(mat02 * vec2f(2, 3), vec2f(6, -2))
        XCTAssertEqual(mat02.det, 2)
        XCTAssertEqual(try invert(mat02), mat2f(0, 1, -2, 0) / 2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            for _ in 0..<10000 {
                let _ : mat2f = mat2f(1) * mat2f(1)
            }
        }
    }

}
