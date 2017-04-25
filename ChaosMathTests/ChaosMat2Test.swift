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
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        var mat : mat2 = mat2()
        XCTAssertEqual(0, mat[0, 0])
        XCTAssertEqual(0, mat[0, 1])
        XCTAssertEqual(0, mat[1, 0])
        XCTAssertEqual(0, mat[1, 1])
        
        mat = mat2(1)
        XCTAssertEqual(1, mat[0, 0])
        XCTAssertEqual(0, mat[0, 1])
        XCTAssertEqual(0, mat[1, 0])
        XCTAssertEqual(1, mat[1, 1])
        
        mat = mat2(1, 2, 3, 4)
        XCTAssertEqual(1, mat[0, 0])
        XCTAssertEqual(3, mat[0, 1])
        XCTAssertEqual(2, mat[1, 0])
        XCTAssertEqual(4, mat[1, 1])
        
        let a11 : Float = Float(arc4random_uniform(10))
        let a21 : Float = Float(arc4random_uniform(10))
        let a12 : Float = Float(arc4random_uniform(10))
        let a22 : Float = Float(arc4random_uniform(10))
        
        mat = mat2(vec2(a11, a21), vec2(a12, a22))
        XCTAssertEqual(a11, mat[0, 0])
        XCTAssertEqual(a12, mat[0, 1])
        XCTAssertEqual(a21, mat[1, 0])
        XCTAssertEqual(a22, mat[1, 1])
        
        mat = [5, 6 ,7 ,8]
        XCTAssertEqual(5, mat[0, 0])
        XCTAssertEqual(7, mat[0, 1])
        XCTAssertEqual(6, mat[1, 0])
        XCTAssertEqual(8, mat[1, 1])
    }
    
    
    func testOperators () {
        let m : mat2 = mat2(
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10)),
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10))
        )
        
        let n : mat2 = mat2(
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10)),
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10))
        )
        
        XCTAssertEqual(-m, mat2(-m.array[0], -m.array[1], -m.array[2], -m.array[3]))
        XCTAssertEqual(n + m , m + n)
        XCTAssertEqual(n - m , -(m - n))
        XCTAssertEqual(2 * m , m * 2)
        XCTAssertEqual(m * 0.5, m / 2)
        
        var o = m + n
        XCTAssertEqual(o[0, 0], m[0, 0] + n[0, 0])
        XCTAssertEqual(o[0, 1], m[0, 1] + n[0, 1])
        XCTAssertEqual(o[1, 0], m[1, 0] + n[1, 0])
        XCTAssertEqual(o[1, 1], m[1, 1] + n[1, 1])
        
        o = m - n
        XCTAssertEqual(o[0, 0], m[0, 0] - n[0, 0])
        XCTAssertEqual(o[0, 1], m[0, 1] - n[0, 1])
        XCTAssertEqual(o[1, 0], m[1, 0] - n[1, 0])
        XCTAssertEqual(o[1, 1], m[1, 1] - n[1, 1])
        
        o = m * n
        let a11 : Float = m[0, 0] * n[0, 0] + m[0, 1] * n[1, 0]
        let a21 : Float = m[1, 0] * n[0, 0] + m[1, 1] * n[1, 0]
        let a12 : Float = m[0, 0] * n[0, 1] + m[0, 1] * n[1, 1]
        let a22 : Float = m[1, 0] * n[0, 1] + m[1, 1] * n[1, 1]
        XCTAssertEqual(mat2(a11, a21, a12, a22), o)
        
        // No need to proof m / x since:
        // 2 * m == m * 2 ^ m * 0.5 == m / 2
        
        o = 2 * m
        XCTAssertEqual(2 * m[0, 0], o[0, 0])
        XCTAssertEqual(2 * m[0, 1], o[0, 1])
        XCTAssertEqual(2 * m[1, 0], o[1, 0])
        XCTAssertEqual(2 * m[1, 1], o[1, 1])
        
        
        o = m
        o += n
        XCTAssertEqual(m + n, o)
        
        o = m
        o -= n
        XCTAssertEqual(m - n, o)
        
        o = m
        o *= n
        XCTAssertEqual(m * n, o)
        
        o = m
        o *= 2
        XCTAssertEqual(m * 2, o)
        
        o = m
        o /= 2
        XCTAssertEqual(m / 2, o)
    }
    
    
    func testFunctions () {
        let m : mat2 = mat2(
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10)),
            Float(arc4random_uniform(10)), Float(arc4random_uniform(10))
        )
        
        let n : mat2 = mat2(1, 2, 0, 4)
        
        let s : Float = m.det
        XCTAssertEqual(m[0, 0] * m[1, 1] - m[1, 0] * m [0, 1], s)

        var o : mat2 = transpose(m)
        XCTAssertEqual(o[0, 0], m[0, 0])
        XCTAssertEqual(o[0, 1], m[1, 0])
        XCTAssertEqual(o[1, 0], m[0, 1])
        XCTAssertEqual(o[1, 1], m[1, 1])
        
        o = try! invert(n)
        XCTAssertEqual(mat2(1), o * n)
    }
}
