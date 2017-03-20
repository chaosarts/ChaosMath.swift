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
        return SelfType(-value.re, -value.im)
    }
    
    
    /// Sum operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The sum of the two quaternions
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.re + right.re, left.im + right.im)
    }
    
    
    /// Diff operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The difference of the two quaternions
    public static func - (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.re - right.re, left.im - right.im)
    }
    
    
    /// Multiplication operator
    /// - parameter left: Left side operand
    /// - parameter right: Right side operand
    /// - returns: The product of the two quaternions
    public static func * (left: SelfType, right: SelfType) -> SelfType {
        let r : ElementType = left.re * right.re - left.i * right.i - left.j * right.j - left.k * right.k
        let i : ElementType = left.re * right.i - left.i * right.re - left.j * right.k - left.k * right.j
        let j : ElementType = left.re * right.j - left.i * right.k - left.j * right.re - left.k * right.i
        let k : ElementType = left.re * right.k - left.i * right.j - left.j * right.i - left.k * right.re
        
        return SelfType(r, VectorType(i, j, k))
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */

    /// Provides the real part of the quaternion
    public var re: ElementType
    
    /// Provides the imaginary vector
    public var im: VectorType
    
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the components as a list
    public var array : Array<ElementType> {
        get {return [re, im.x, im.y, im.z]}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var i: ElementType {
        get {return im.x}
        set {im.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var j: ElementType {
        get {return im.y}
        set {im.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var k: ElementType {
        get {return im.z}
        set {im.z = newValue}
    }
    
    
    public var x: ElementType {
        get {return re}
        set {re = newValue}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var y: ElementType {
        get {return im.x}
        set {im.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var z: ElementType {
        get {return im.y}
        set {im.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var w: ElementType {
        get {return im.z}
        set {im.z = newValue}
    }
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    
    public init (_ r: ElementType, _ v: VectorType) {
        self.re = r
        self.im = v
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
        self.init(q.re, q.i, q.j, q.k)
    }
    
    
    /// Copies the first four elements of the fiven list, otherwise 0
    /// - parameter array: The array of values to copy from
    public init (_ array: Array<ElementType>) {
        re = array.count > 0 ? array[0] : 0
        im = VectorType()
        im.x = array.count > 1 ? array[1] : 0
        im.y = array.count > 2 ? array[2] : 0
        im.z = array.count > 3 ? array[3] : 0
    }
    
    
    /// ExpressibleByArrayLiteral initializer
    public init (arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
}


extension tquaternion where T: ArithmeticFloatType {
    public init<S: ArithmeticIntType> (_ q: tquaternion<S>) {
        self.init(T(q.re), tvec3<T>(q.im))
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
    return tquaternion<T>(q.re, -q.im)
}


/// Returns the dot product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The dot product
public func dot<T: ArithmeticType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> T {
    return left.re * right.re + left.i * right.i + left.j * right.j + left.k * right.k
}


/// Returns the cross product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The cross product
public func cross<T: ArithmeticType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> tquaternion<T> {
    return tquaternion<T>(0, cross(left.im, right.im))
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
public func magnitude<T: ArithmeticIntType> (_ q: tquaternion<T>) -> Float {
    return dot(q, q).squareRoot()
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude<T: ArithmeticFloatType> (_ q: tquaternion<T>) -> T {
    return dot(q, q).squareRoot()
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize<T: ArithmeticIntType> (_ q: tquaternion<T>) -> tquaternion<Float> {
    let mag : Float = magnitude(q)
    return tquaternion<Float>(q.x.toFloat() / mag, q.im.x.toFloat() / mag, q.im.y.toFloat() / mag, q.im.z.toFloat() / mag)
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize<T: ArithmeticFloatType> (_ q: tquaternion<T>) -> tquaternion<T> {
    let mag : T = magnitude(q)
    return tquaternion<T>(q.x / mag, q.im.x / mag, q.im.y / mag, q.im.z / mag)
}
