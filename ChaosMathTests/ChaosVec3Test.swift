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
    
    var v1 : vec3 = vec3()
    var v2 : vec3 = vec3()
    var v3 : vec3 = vec3()

    override func setUp() {
        super.setUp()
        
        v1.x = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v1.y = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v1.z = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        
        v2.x = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v2.y = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v2.z = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        
        v3.x = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v3.y = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
        v3.z = Float(arc4random_uniform(100) + 1) / Float(arc4random_uniform(100) + 1)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        v1 = vec3()
        XCTAssertEqual(0, v1.x)
        XCTAssertEqual(0, v1.y)
        XCTAssertEqual(0, v1.z)
        
        v1 = vec3(1)
        XCTAssertEqual(1, v1.x)
        XCTAssertEqual(0, v1.y)
        XCTAssertEqual(0, v1.z)
        
        v1 = vec3(1, 2)
        XCTAssertEqual(1, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(0, v1.z)
        
        v1 = vec3(1, 2, 3)
        XCTAssertEqual(1, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(3, v1.z)
        
        v1 = [3, 2, 1]
        XCTAssertEqual(3, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(1, v1.z)
        
        v1 = vec3(1, vec2(2, 3))
        XCTAssertEqual(1, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(3, v1.z)
        
        v1 = vec3(vec2(3, 2), 1)
        XCTAssertEqual(3, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(1, v1.z)
        XCTAssertEqual([3, 2, 1], v1)
        
        v1 = vec3(v2)
        XCTAssertEqual(v2, v1)
        
        v1 = 2
        XCTAssertEqual(2, v1.x)
        XCTAssertEqual(2, v1.y)
        XCTAssertEqual(2, v1.z)
    }
    
    
    func testOperators () {
        v1.x = Float(arc4random_uniform(100)) / Float(arc4random_uniform(100))
        v1.y = Float(arc4random_uniform(100)) / Float(arc4random_uniform(100))
        v1.z = Float(arc4random_uniform(100)) / Float(arc4random_uniform(100))
        
        XCTAssertEqual(vec3(-v1.x, -v1.y, -v1.z), -v1)
        
        var v : vec3 = v1 + v2
        XCTAssertEqual(v1.x + v2.x, v.x)
        XCTAssertEqual(v1.y + v2.y, v.y)
        XCTAssertEqual(v1.z + v2.z, v.z)
        XCTAssertEqual(v, v2 + v1)
        
        v = v1 - v2
        XCTAssertEqual(v1.x - v2.x, v.x)
        XCTAssertEqual(v1.y - v2.y, v.y)
        XCTAssertEqual(v1.z - v2.z, v.z)
        XCTAssertEqual(-(v2 - v1), v)
        
        v = v1 * v2
        XCTAssertEqual(v1.x * v2.x, v.x)
        XCTAssertEqual(v1.y * v2.y, v.y)
        XCTAssertEqual(v1.z * v2.z, v.z)
        XCTAssertEqual(v2 * v1, v)
        
        v = v1 * 2
        XCTAssertEqual(v1.x * 2, v.x)
        XCTAssertEqual(v1.y * 2, v.y)
        XCTAssertEqual(v1.z * 2, v.z)
        XCTAssertEqual(v1 * 2, v)
        
        v = v1 / 2
        XCTAssertEqual(v1.x / 2, v.x)
        XCTAssertEqual(v1.y / 2, v.y)
        XCTAssertEqual(v1.z / 2, v.z)
        
        v = v1
        v += v1
        XCTAssertEqual(2 * v1, v)
        
        v -= v1
        XCTAssertEqual(v1, v)
        
        v *= v2
        XCTAssertEqual(v1 * v2, v)
        
        v *= 2
        XCTAssertEqual(v1 * v2 * 2, v)
        
        v /= 2
        XCTAssertEqual(v1 * v2, v)
    }
    
    
    func testFunctions () {
        var s : Float = v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
        XCTAssertEqual(s, dot(v1, v2))
        XCTAssertEqual(s, dot(v2, v1))
        
        s = v1.x * v1.x + v1.y * v1.y + v1.z * v1.z
        XCTAssertEqual(s, dot(v1, v1))
        
        s = sqrt(s)
        XCTAssertEqual(s, magnitude(v1))
        
        var v : vec3 = normalize(v1)
        XCTAssertEqual(v1 / s, v)
        
        s = acos(dot(v1, v2) / (magnitude(v1) * magnitude(v2)))
        XCTAssertEqual(s, angle(v1, v2))
        
        if s == 0 {
         	v2 = vec3(v2.z, -v2.x, v2.y)
        }
        
        v = cross(v1, v2)
        XCTAssertEqual(rad(90), angle(v, v1))
        XCTAssertEqual(rad(90), angle(v, v2))
    }
    
    

    func testPerformanceExample() {
        self.measure {
        
        }
    }

}
