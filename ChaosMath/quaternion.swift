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
    public typealias VectorType = tvec3<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Operators
     +--------------------------------------------------------------------------
     */
    
	/// Returns the additive inverse of the quaternion
    /// - parameter value: The quaternion to inverse
    /// - returns: The inverse quaternion
    public static prefix func -(_ value: SelfType) -> SelfType {
        return SelfType(-value.r, -value.v)
    }
    
    
    /// Sum operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The sum of the two quaternions
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.r + right.r, left.v + right.v)
    }
    
    
    /// Diff operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The difference of the two quaternions
    public static func - (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.r - right.r, left.v - right.v)
    }
    
    
    /// Multiplication operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The product of the two quaternions
    public static func * (left: SelfType, right: SelfType) -> SelfType {
        let r : ElementType = left.r * right.r - left.i * right.i - left.j * right.j - left.k * right.k
        let i : ElementType = left.r * right.i - left.i * right.r - left.j * right.k - left.k * right.j
        let j : ElementType = left.r * right.j - left.i * right.k - left.j * right.r - left.k * right.i
        let k : ElementType = left.r * right.k - left.i * right.j - left.j * right.i - left.k * right.r
        
        return SelfType(r, VectorType(i, j, k))
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */

    /// Provides the real part of the quaternion
    public var r: ElementType
    
    /// Provides the imaginary vector
    public var v: VectorType
    
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the components as a list
    public var array : Array<ElementType> {
        get {return [r, v.x, v.y, v.z]}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var i: ElementType {
        get {return v.x}
        set {v.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var j: ElementType {
        get {return v.y}
        set {v.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var k: ElementType {
        get {return v.z}
        set {v.z = newValue}
    }
    
    
    public var x: ElementType {
        get {return r}
        set {r = newValue}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var y: ElementType {
        get {return v.x}
        set {v.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var z: ElementType {
        get {return v.y}
        set {v.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var w: ElementType {
        get {return v.z}
        set {v.z = newValue}
    }
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    
    public init (_ r: ElementType, _ v: VectorType) {
        self.r = r
        self.v = v
    }
    
    /// Initializes the quaternion with its four components
    /// - parameter r: The real part of the quaternion
    /// - parameter i: The imaginary part i of the quaternion
    /// - parameter j: The imaginary part j of the quaternion
    /// - parameter k: The imaginary part k of the quaternion
    public init (_ r: ElementType, _ i: ElementType, _ j: ElementType, _ k: ElementType) {
        self.init(r, VectorType(i, j, k))
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
        v = VectorType()
        v.x = array.count > 1 ? array[1] : 0
        v.y = array.count > 2 ? array[2] : 0
        v.z = array.count > 3 ? array[3] : 0
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


/// Returns the conjugate of the quaternion
/// - parameter q: The quaternion to conjugate
/// - returns: The conjugated quaternion
public func conjugate<T: ArithmeticType> (_ q: tquaternion<T>) -> tquaternion<T> {
    return tquaternion<T>(q.r, -q.v)
}


/// Returns the dot product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The dot product
public func dot<T: ArithmeticType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> T {
    return left.r * right.r + left.i * right.i + left.j * right.j + left.k * right.k
}


/// Returns the cross product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The cross product
public func cross<T: ArithmeticType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> tquaternion<T> {
    return tquaternion<T>(0, cross(left.v, right.v))
}


/// Returns the norm of the quaternion
/// - parameter q: The quaternion to calculate the norm of
/// - returns: The norm of the quaternion
public func norm<T: ArithmeticType> (_ q: tquaternion<T>) -> T {
    return dot(q, q)
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude (_ q: quaternioni) -> Float {
    return sqrt(Float(dot(q, q)))
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude (_ q: quaternionf) -> Float {
    return sqrt(dot(q, q))
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude (_ q: quaterniond) -> Double {
    return sqrt(dot(q, q))
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize (_ q: quaternioni) -> quaternionf {
    let mag : Float = magnitude(q)
    return quaternionf(Float(q.x) / mag, Float(q.v.x) / mag, Float(q.v.y) / mag, Float(q.v.z) / mag)
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize<T: ArithmeticType> (_ q: tquaternion<T>) -> tquaternion<T> {
    let mag : Float = magnitude(q)
    return tquaternion<T>(q.x / mag, q.v.x / mag, q.v.y / mag, q.v.z / mag)
}
