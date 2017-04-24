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
    
    let initLoops : Int = 1000000
    
    let funcLoops : Int = 1000000
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    /// Tests the init functions for tvec2
    func testInit () {
        var vecf: vec2f = vec2f(1, 2)
        XCTAssertEqual(1, vecf.x)
        XCTAssertEqual(2, vecf.y)
        
        vecf = vec2f(1)
        XCTAssertEqual(1, vecf.x)
        XCTAssertEqual(0, vecf.y)
        
        vecf = vec2f()
        XCTAssertEqual(0, vecf.x)
        XCTAssertEqual(0, vecf.y)
        
        let veci : vec2i = vec2i(vec2f(1.5, 2.3))
        XCTAssertEqual(1, veci.x)
        XCTAssertEqual(2, veci.y)
    }
    
    
    func testOperators () {
        let v1 : vec2 = vec2(3, 5)
        var v2 : vec2 = v1 + vec2(1.5, -0.5)
        
        XCTAssertEqual(4.5, v2.x)
        XCTAssertEqual(4.5, v2.y)
        XCTAssertEqual(vec2(4.5 * 3, 5 * 4.5), v2 * v1)
        XCTAssertEqual(v1 * v2, v2 * v1)
        XCTAssertEqual(vec2(9, 15), v1 * 3)
        XCTAssertEqual(3 * v1, v1 * 3)
        
        v2 /= 1.5
        XCTAssertEqual(vec2(3, 3), v2)
        
        v2 += vec2(1, -1)
        XCTAssertEqual(vec2(4, 2), v2)
    }
    
    
    func testPerformanceImplicitInit() {
        self.measure {
            for _ in 0..<self.initLoops {
            	_ = vec2()
            }
        }
    }
    
    
    func testPerformanceInitWithFirstExplicit() {
        self.measure {
            for _ in 0..<self.initLoops {
                let _ : vec2 = vec2(1)
            }
        }
    }
    
    
    func testPerformanceInitExplicit() {
        self.measure {
            for _ in 0..<self.initLoops {
                let _ : vec2 = vec2(1, 2)
            }
        }
    }
    
    
    func testPerformanceInitArrayLiteral() {
        self.measure {
            for _ in 0..<self.initLoops {
                let _ : vec2 = [1, 2]
            }
        }
    }
    
    
    func testPerformanceDot() {
        let v1 : vec2 = vec2(1, 2)
        let v2 : vec2 = vec2(2, 1)
        self.measure {
            for _ in 0..<self.funcLoops {
                let _ : Float = dot(v1, v2)
            }
        }
    }
    
    
    func testPerformanceMagnitude() {
        let vec : vec2 = vec2(1, 2)
        self.measure {
            for _ in 0..<self.funcLoops {
                let _ : Float = magnitude(vec)
            }
        }
    }
    
    
    func testPerformanceNormalize() {
        let vec : vec2 = vec2(1, 2)
        self.measure {
            for _ in 0..<self.funcLoops {
                let _ : vec2 = normalize(vec)
            }
        }
    }
    
    
    
    func testPerformanceAngle() {
        let v1 : vec2 = vec2(1, 2)
        let v2 : vec2 = vec2(2, 1)
        self.measure {
            for _ in 0..<self.funcLoops {
                let _ : Float = angle(v1, v2)
            }
        }
    }
}
