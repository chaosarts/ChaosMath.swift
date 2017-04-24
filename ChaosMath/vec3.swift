//
//  vec3.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec3<T: ArithmeticScalarType> : VectorType {
    
	public typealias ElementType = T
    public typealias SelfType = tvec3<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the dimension of this vector struct
    public static var dim : Int {
        return 3
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        return SelfType(1, 0, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        return SelfType(0, 1, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e3 : SelfType {
        return SelfType(0, 0, 1)
    }
	
	
	/*
	+--------------------------------------------------------------------------
	| Stored properties
	+--------------------------------------------------------------------------
	*/
	
	/// Provides the x value of the vector
	public var x: ElementType = 0
	
	/// Provides the y value of the vector
	public var y: ElementType = 0
	
	/// Provides the z component of the vector
	public var z: ElementType = 0
	
	
	/*
	+--------------------------------------------------------------------------
	| Derived properties
	+--------------------------------------------------------------------------
	*/
	
	/// Returns the vector as array
	public var array : Array<ElementType> {
		return [x, y, z]
	}
	
	
	/*
	+--------------------------------------------------------------------------
	| Initializers
	+--------------------------------------------------------------------------
	*/

    
    /// Initializes the vector
    /// - parameter x: The x component of the vector
    /// - parameter y: The y component of the vector
    /// - parameter z: The z component of the vector
    public init <ForeignType: ArithmeticScalarType>(_ x: ForeignType = 0, _ y: ForeignType = 0, _ z: ForeignType = 0) {
        self.x = ElementType(x)
        self.y = ElementType(y)
        self.z = ElementType(z)
    }
	
	
	/// Initializes the vector with an other
	/// - parameters vec: The vector to copy
	public init<ForeignType: ArithmeticScalarType> (_ vec: tvec3<ForeignType>) {
		self.x = ElementType(vec.x)
        self.y = ElementType(vec.y)
        self.z = ElementType(vec.z)
	}
    
    
    /// Initializes the vector with a vec2 for x and y and a scalar for z
    /// - parameter vec:
    /// - parameter z:
    public init<V: ArithmeticScalarType, S: ArithmeticScalarType> (_ vec: tvec2<V>, _ z: S = 0) {
        self.x = ElementType(vec.x)
        self.y = ElementType(vec.y)
        self.z = ElementType(z)
    }
    
    
    /// Initializes the vector with a vec2 for y and z and a scalar for x
    /// - parameter vec:
    /// - parameter z:
    public init<S: ArithmeticScalarType, V: ArithmeticScalarType> (_ x: S, _ vec: tvec2<V>) {
        self.x = ElementType(x)
        self.y = ElementType(vec.x)
        self.z = ElementType(vec.y)
    }
    
    
    /// Implementation of the ExpressibleByIntegerLiteral protocol
    /// - parameter value
    public init (integerLiteral value: Int) {
        self.init(ElementType(value), ElementType(value), ElementType(value))
    }
	
	
	/// Initializes the vector with an array
	public init (arrayLiteral elements: ElementType...) {
		if (elements.count > 0) {x = elements[0]}
		if (elements.count > 1) {y = elements[1]}
		if (elements.count > 2) {z = elements[2]}
	}
}


public typealias vec3i = tvec3<Int>
public typealias vec3f = tvec3<Float>
public typealias vec3d = tvec3<Double>
public typealias vec3 = vec3f

/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */


/// Negates the vector
/// - parameter value: The vector to be negated
/// - returns: The negated vector
public prefix func -<T: ArithmeticScalarType> (value: tvec3<T>) -> tvec3<T> {
    return tvec3<T>(-value.x, -value.y, -value.z)
}

/// Sum operator
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The sum of both operands
public func +<T: ArithmeticScalarType> (left: tvec3<T>, right: tvec3<T>) -> tvec3<T> {
    let a : T = left.x + right.x
    let b : T = left.y + right.y
    let c : T = left.z + right.z
    
    return tvec3<T>(a, b, c)
}


/// Returns the difference vector
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func -<T: ArithmeticScalarType> (left: tvec3<T>, right: tvec3<T>) -> tvec3<T> {
    return left + (-right)
}


/// Returns the component wise product
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func *<T: ArithmeticScalarType> (left: tvec3<T>, right: tvec3<T>) -> tvec3<T> {
    return tvec3<T>(left.x * right.x, left.y * right.y, left.z * right.z)
}


/// Multiplies a scalar with a vecotr
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tvec3<T>) -> tvec3<T> {
    return tvec3<T>(T(left) * right.x, T(left) * right.y, T(left) * right.z)
}


/// Multiplies a scalar with a vecotr
public func *<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec3<T>, right: S) -> tvec3<T> {
    return tvec3<T>(left.x * T(right), left.y * T(right), left.z * T(right))
}


/// Devides the vector by a scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec3<T>, right: S) -> tvec3<T> {
    return tvec3<T>(left.x / T(right), left.y / T(right), left.z / T(right))
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func +=<T: ArithmeticScalarType> (left: inout tvec3<T>, right: tvec3<T>) {
    left = left + right
}



/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func -=<T: ArithmeticScalarType> (left: inout tvec3<T>, right: tvec3<T>) {
    left = left - right
}



/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType> (left: inout tvec3<T>, right: tvec3<T>) {
    left = left * right
}



/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tvec3<T>, right: S) {
    left = left * right
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func /=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tvec3<T>, right: S) {
    left = left / T(right)
}


/// Compares to vectors
public func ==<T: ArithmeticScalarType> (left: tvec3<T>, right: tvec3<T>) -> Bool {
    return left.x == right.x && left.y == right.y && left.z == right.z
}


/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */

/// Returns the dot product of two vectors
public func dot<T: ArithmeticScalarType> (_ left: tvec3<T>, _ right: tvec3<T>) -> T {
    let a : T = left.x * right.x
    let b : T = left.y * right.y
    let c : T = left.z * right.z
    
    return a + b + c
}


/// Returns the (left hand oriented) normal of the given vectors
/// - parameter left: The left operand (thumb)
/// - parameter right: The right operand (pointer)
/// - returns: The normal vector (middlefinger) which is othogonal to left and right
public func cross<T: ArithmeticScalarType> (_ left: tvec3<T>, _ right: tvec3<T>) -> tvec3<T>  {
    let x1 : T = left.y * right.z 
    let x2 : T = left.z * right.y
    let x : T =  x1 - x2 
    let y1 : T = left.z * right.x 
    let y2 : T = left.x * right.z
    let y : T =  y1 - y2 
    let z1 : T = left.x * right.y 
    let z2 : T = left.y * right.x
    let z : T =  z1 - z2 
    
    return tvec3<T>(x, y, z)
}


/// Calculates the determinant of three given vectors
/// - parameter x:
/// - parameter y:
/// - parameter z:
/// - returns: The determinant of the three vectors
public func determinant<T :ArithmeticScalarType> (_ x: tvec3<T>, _ y: tvec3<T>, _ z: tvec3<T>) -> T {
    let a1 : T = x.x * y.y * z.z
    let a2 : T = y.x * z.y * x.z
    let a3 : T = z.x * x.y * y.z
    let a : T = a1 + a2 + a3
    
    let b1 : T = z.x * y.y * x.z
    let b2 : T = y.x * x.y * z.z
    let b3 : T = x.x * z.y * y.z
    let b : T = b1 + b2 + b3
    return a - b
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticIntType> (_ value: tvec3<T>) -> Float {
	return dot(value, value).sqrt()
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticFloatType> (_ value: tvec3<T>) -> T {
	return dot(value, value).sqrt()
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticIntType> (_ value: tvec3<T>) -> vec3f {
	let l = magnitude(value)
	return vec3f(value.x.toFloat() / l, value.y.toFloat() / l, value.z.toFloat() / l)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticFloatType> (_ value: tvec3<T>) -> tvec3<T> {
	return value / magnitude(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticIntType> (_ left: tvec3<T>, _ right: tvec3<T>) -> Float {
	let value : Float = dot(left, right).toFloat() / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticFloatType> (_ left: tvec3<T>, _ right: tvec3<T>) -> T {
	let value : T = dot(left, right) / (magnitude(left) * magnitude(right))
	return value.acos()
}
