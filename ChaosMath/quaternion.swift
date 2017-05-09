//
//  quaternion.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tquaternion<T: ArithmeticScalarType> : ExpressibleByArrayLiteral {
    
    public typealias ElementType = T
    public typealias SelfType = tquaternion<ElementType>
    public typealias VectorType = tvec3<ElementType>
    
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */

    /// Provides the real part of the quaternion
    public var real: ElementType = 0
    
    /// Provides the imaginary vector
    public var ivec: VectorType = VectorType(0)
    
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the components as a list
    public var array : Array<ElementType> {
        get {return [real, ivec.x, ivec.y, ivec.z]}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var i: ElementType {
        get {return ivec.x}
        set {ivec.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var j: ElementType {
        get {return ivec.y}
        set {ivec.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var k: ElementType {
        get {return ivec.z}
        set {ivec.z = newValue}
    }
    
    
    public var x: ElementType {
        get {return real}
        set {real = newValue}
    }
    
    /// Provides the imaginary part i of the quaternion
    public var y: ElementType {
        get {return ivec.x}
        set {ivec.x = newValue}
    }
    
    /// Provides the imaginary part j of the quaternion
    public var z: ElementType {
        get {return ivec.y}
        set {ivec.y = newValue}
    }
    
    /// Provides the imaginary part k of the quaternion
    public var w: ElementType {
        get {return ivec.z}
        set {ivec.z = newValue}
    }
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the quaternion with a real value and a imaginary vector
    /// - parameter r: The real part of the quaternion
    /// - parameter v: A vector of value for the imaginary parts
    public init<ForeignType: ArithmeticScalarType> (_ r: ForeignType, _ v: tvec3<ForeignType>) {
        real = ElementType(r)
        ivec = VectorType(v)
    }
    
    /// Initializes the quaternion with its four components
    /// - parameter r: The real part of the quaternion
    /// - parameter i: The imaginary part i of the quaternion
    /// - parameter j: The imaginary part j of the quaternion
    /// - parameter k: The imaginary part k of the quaternion
    public init<ForeignType: ArithmeticScalarType> (_ r: ForeignType = 0, _ i: ForeignType = 0, _ j: ForeignType = 0, _ k: ForeignType = 0) {
        real = ElementType(r)
        ivec = VectorType(i, j, k)
    }
    
    
    /// Copy constructor
    /// - parameter q: The quaternion to copy values from
    public init<ForeignType: ArithmeticScalarType> (_ q: tquaternion<ForeignType>) {
        self.init(q.real, q.ivec)
    }
    
    
    /// Copies the first four elements of the fiven list, otherwise 0
    /// - parameter array: The array of values to copy from
    public init<ForeignType: ArithmeticScalarType> (_ array: Array<ForeignType>) {
        real = array.count > 0 ? ElementType(array[0]) : 0
        ivec.x = array.count > 1 ? ElementType(array[1]) : 0
        ivec.y = array.count > 2 ? ElementType(array[2]) : 0
        ivec.z = array.count > 3 ? ElementType(array[3]) : 0
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

/*
 +------------------------------------------------------------------------------
 | Operators
 +------------------------------------------------------------------------------
 */

/// Returns the additive inverse of the quaternion
/// - parameter value: The quaternion to inverse
/// - returns: The inverse quaternion
public prefix func -<ElementType: ArithmeticScalarType> (_ value: tquaternion<ElementType>) -> tquaternion<ElementType> {
    let r : ElementType = -value.real
    let i : ElementType = -value.i
    let j : ElementType = -value.j
    let k : ElementType = -value.k
    return tquaternion<ElementType>(r, i, j, k)
}


/// Sum operator
/// - parameter left: Left side operand
/// - parameter right: Right side operand
/// - returns: The sum of the two quaternions
public func +<ElementType: ArithmeticScalarType> (left: tquaternion<ElementType>, right: tquaternion<ElementType>) -> tquaternion<ElementType> {
    let r : ElementType = left.real + right.real
    let i : ElementType = left.i + right.i
    let j : ElementType = left.j + right.j
    let k : ElementType = left.k + right.k
    return tquaternion<ElementType>(r, i, j, k)
}


/// Diff operator
/// - parameter left: Left side operand
/// - parameter right: Right side operand
/// - returns: The difference of the two quaternions
public func -<ElementType: ArithmeticScalarType> (left: tquaternion<ElementType>, right: tquaternion<ElementType>) -> tquaternion<ElementType> {
    let r : ElementType = left.real - right.real
    let i : ElementType = left.i - right.i
    let j : ElementType = left.j - right.j
    let k : ElementType = left.k - right.k
    return tquaternion<ElementType>(r, i, j, k)
}


/// Multiplication operator
/// - parameter left: Left side operand
/// - parameter right: Right side operand
/// - returns: The product of the two quaternions
public func *<ElementType: ArithmeticScalarType> (left: tquaternion<ElementType>, right: tquaternion<ElementType>) -> tquaternion<ElementType> {
    var a : ElementType = left.real * right.real
    var b : ElementType = left.i * right.i
    var c : ElementType = left.j * right.j
    var d : ElementType = left.k * right.k
    var r : ElementType = a - b
    r = r - c
    r = r - d
    
    a = left.real * right.i
    b = left.i * right.real
    c = left.j * right.k
    d = left.k * right.j
    var i : ElementType = a - b
    i = i - c
    i = i - d
    
    a = left.real * right.j
    b = left.i * right.k
    c = left.j * right.real
    d = left.k * right.i
    var j : ElementType = a - b
    j = j - c
    j = j - d
    
    a = left.real * right.k
    b = left.i * right.j
    c = left.j * right.i
    d = left.k * right.real
    var k : ElementType = a - b
    k = k - c
    k = k - d
    
    return tquaternion<ElementType>(r, tvec3<ElementType>(i, j, k))
}


/// Compound sum operation
/// - parameter left
/// - parameter right
public func +=<ElementType: ArithmeticScalarType> (left: inout tquaternion<ElementType>, right: tquaternion<ElementType>) {
    left = left + right
}


/// Compound diff operation
/// - parameter left
/// - parameter right
public func -=<ElementType: ArithmeticScalarType> (left: inout tquaternion<ElementType>, right: tquaternion<ElementType>) {
    left = left - right
}


/// Compound mul operation
/// - parameter left
/// - parameter right
public func *=<ElementType: ArithmeticScalarType> (left: inout tquaternion<ElementType>, right: tquaternion<ElementType>) {
    left = left * right
}



/*
 +------------------------------------------------------------------------------
 | Functions
 +------------------------------------------------------------------------------
 */

/// Returns the conjugate of the quaternion
/// - parameter q: The quaternion to conjugate
/// - returns: The conjugated quaternion
public func conjugate<T: ArithmeticScalarType> (_ q: tquaternion<T>) -> tquaternion<T> {
    return tquaternion<T>(q.real, -q.ivec)
}


/// Returns the dot product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The dot product
public func dot<T: ArithmeticScalarType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> T {
    let a : T = left.real * right.real
    let b : T = left.i * right.i
    let c : T = left.j * right.j
    let d : T = left.k * right.k
    return a + b + c + d
}


/// Returns the cross product of two quaternions
/// - parameter left: The left side operand
/// - parameter right: The right side operand
/// - returns: The cross product
public func cross<T: ArithmeticScalarType> (_ left: tquaternion<T>, _ right: tquaternion<T>) -> tquaternion<T> {
    return tquaternion<T>(0, cross(left.ivec, right.ivec))
}


/// Returns the norm of the quaternion
/// - parameter q: The quaternion to calculate the norm of
/// - returns: The norm of the quaternion
public func norm<T: ArithmeticScalarType> (_ q: tquaternion<T>) -> T {
    return dot(q, q)
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude<T: ArithmeticIntType> (_ q: tquaternion<T>) -> Float {
    return dot(q, q).sqrt()
}


/// Returns the magnitude of the quaternion
/// - parameter q: The quaternion to calculate the magnitude of
/// - returns: The magnitude of the quaternion
public func magnitude<T: ArithmeticFloatType> (_ q: tquaternion<T>) -> T {
    return dot(q, q).sqrt()
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize<T: ArithmeticIntType> (_ q: tquaternion<T>) -> tquaternion<Float> {
    let mag : Float = magnitude(q)
    let x : Float = q.x.toFloat() / mag
    let y : Float = q.ivec.x.toFloat() / mag
    let z : Float = q.ivec.y.toFloat() / mag
    let w : Float = q.ivec.z.toFloat() / mag
    return tquaternion<Float>(x, y, z, w)
}


/// Calculates the normalized quaternionn
/// - parameter q: The quaternionen to normalize
/// - returns: The normalized quaternion
public func normalize<T: ArithmeticFloatType> (_ q: tquaternion<T>) -> tquaternion<T> {
    let mag : T = magnitude(q)
    let x : T = q.x / mag
    let y : T = q.ivec.x / mag
    let z : T = q.ivec.y / mag
    let w : T = q.ivec.z / mag
    return tquaternion<T>(x, y, z, w)
}
