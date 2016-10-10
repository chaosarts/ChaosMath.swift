//
//  quaternion.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tquaternion<T: ArithmeticType> : ExpressibleByArrayLiteral {
    
    public typealias ElementType = T
    public typealias SelfType = tquaternion<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Operators
     +--------------------------------------------------------------------------
     */
    
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */

    /// Provides the real part of the quaternion
    public var r: ElementType
    
    /// Provides the imaginary part i of the quaternion
    public var i: ElementType
    
    /// Provides the imaginary part j of the quaternion
    public var j: ElementType
    
    /// Provides the imaginary part k of the quaternion
    public var k: ElementType
    
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the components as a list
    public var array : Array<ElementType> {
        get {return [r, i, j, k]}
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the quaternion with its four components
    /// - parameter r: The real part of the quaternion
    /// - parameter i: The imaginary part i of the quaternion
    /// - parameter j: The imaginary part j of the quaternion
    /// - parameter k: The imaginary part k of the quaternion
    public init (_ r: ElementType, _ i: ElementType, _ j: ElementType, _ k: ElementType) {
        self.r = r
        self.i = i
        self.j = j
        self.k = k
    }
    
    
    /// Initializes the neutral element
    public init () {
        self.init(0, 0, 0, 0)
    }
    
    
    /// Initializes the quaternion with only the real part
    /// - parameter r: The real part of the quaternion
    public init (_ r: ElementType) {
        self.init(r, 0, 0, 0)
    }
    
    /// Initializes a pure quaternion
    /// - parameter i: The imaginary part i of the quaternion
    /// - parameter j: The imaginary part j of the quaternion
    /// - parameter k: The imaginary part k of the quaternion
    public init (_ i: ElementType, _ j: ElementType, _ k: ElementType) {
        self.init(0, i, j, k)
    }
    
    
    /// Copy constructor
    /// - parameter q: The quaternion to copy values from
    public init (_ q: SelfType) {
        self.init(q.r, q.i, q.j, q.k)
    }
    
    
    /// Copies the first four elements of the fiven list, otherwise 0
    /// - parameter array: The array of values to copy from
    public init (_ array: Array<ElementType>) {
        r = array.count > 0 ? array[0] : 0
        i = array.count > 1 ? array[1] : 0
        j = array.count > 2 ? array[2] : 0
        k = array.count > 3 ? array[3] : 0
    }
    
    
    /// ExpressibleByArrayLiteral initializer
    public init (arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
}

public typealias quaternioni = tquaternion<Int>
public typealias quaternionf = tquaternion<Float>
public typealias quaterniond = tquaternion<Double>
public typealias quaternion = quaternionf
