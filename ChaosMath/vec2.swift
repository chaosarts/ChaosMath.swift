//
//  vec2.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec2<T: ArithmeticScalarType> : VectorType {

    /// Describes the type of the components
	public typealias ElementType = T

    /// Describes its own type
    public typealias SelfType = tvec2<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the dimension of this vector struct
    public static var dim : Int {
        return 2
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        return SelfType(1, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        return SelfType(0, 1)
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
	
	
	/*
	+--------------------------------------------------------------------------
	| Derived properties
	+--------------------------------------------------------------------------
	*/
	
	/// Returns the vector as array
	public var array : Array<ElementType> {
		return [x, y]
	}
	
	
	/*
	 +--------------------------------------------------------------------------
	 | Initializers
	 +--------------------------------------------------------------------------
	 */

    
    /// Initializes the vector
    /// - parameter x: The x component of the vector
    /// - parameter y: The y component of the vector
    public init <ForeignType: ArithmeticScalarType>(_ x: ForeignType = 0, _ y: ForeignType = 0) {
        self.x = ElementType(x)
        self.y = ElementType(y)
    }
	
	
	/// Initializes the vector with an other
	/// - parameters vec: The vector to copy
	public init<ForeignType: ArithmeticScalarType> (_ vec: tvec2<ForeignType>) {
		self.x = ElementType(vec.x)
        self.y = ElementType(vec.y)
	}
    
    
    /// Implementation of the ExpressibleByIntegerLiteral protocol
    /// - parameter value
    public init(integerLiteral value: Int) {
        self.init(ElementType(value), ElementType(value))
    }
	
	
	/// Initializes the vector with an array
	public init (arrayLiteral elements: ElementType...) {
		if (elements.count > 0) {x = elements[0]}
		if (elements.count > 1) {y = elements[1]}
	}
}


public typealias vec2i = tvec2<Int>
public typealias vec2f = tvec2<Float>
public typealias vec2d = tvec2<Double>
public typealias vec2 = vec2f

/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */


/// Negates the vector
/// - parameter value: The vector to be negated
/// - returns: The negated vector
public prefix func -<T: ArithmeticScalarType> (value: tvec2<T>) -> tvec2<T> {
    let x : T = -value.x
    let y : T = -value.y
    return tvec2<T>(x, y)
}

/// Sum operator
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The sum of both operands
public func +<T: ArithmeticScalarType> (left: tvec2<T>, right: tvec2<T>) -> tvec2<T> {
    let x : T = left.x + right.x
    let y : T = left.y + right.y
    return tvec2<T>(x, y)
}


/// Returns the difference vector
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func -<T: ArithmeticScalarType> (left: tvec2<T>, right: tvec2<T>) -> tvec2<T> {
    let x : T = left.x - right.x
    let y : T = left.y - right.y
    return tvec2<T>(x, y)
}


/// Returns the component wise product
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func *<T: ArithmeticScalarType> (left: tvec2<T>, right: tvec2<T>) -> tvec2<T> {
    let x : T = left.x * right.x
    let y : T = left.y * right.y
    return tvec2<T>(x, y)
}


/// Multiplies a scalar with a vector
/// - parameter left: The scalar value
/// - parameter right: The vector
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tvec2<T>) -> tvec2<T> {
    let scalar : T = T(left)
    let x : T = scalar * right.x
    let y : T = scalar * right.y
    return tvec2<T>(x, y)
}


/// Multiplies a vector with a scalar
/// - parameter left: The vector
/// - parameter right: The scalar value
public func *<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec2<T>, right: S) -> tvec2<T> {
    let scalar : T = T(right)
    let x : T = left.x * scalar
    let y : T = left.y * scalar
    return tvec2<T>(x, y)
}


/// Devides the vector by a scalar
/// - parameter left: The left side of the operator
/// - parameter right: The right side of the operator
/// - returns: The vector devided by scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec2<T>, right: S) -> tvec2<T> {
    let scalar : T = T(right)
    let x : T = left.x / scalar
    let y : T = left.y / scalar
    return tvec2<T>(x, y)
}


/// Compound sum operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func +=<T: ArithmeticScalarType> (left: inout tvec2<T>, right: tvec2<T>) {
    left = left + right
}



/// Compound diff operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func -=<T: ArithmeticScalarType> (left: inout tvec2<T>, right: tvec2<T>) {
    left = left - right
}



/// Compound product operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType> (left: inout tvec2<T>, right: tvec2<T>) {
    left = left * right
}



/// Compound product operator with a scalar
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tvec2<T>, right: S) {
    left = left * right
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func /=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tvec2<T>, right: S) {
    left = left / right
}


/// Compares to vectors
public func ==<T: ArithmeticScalarType> (left: tvec2<T>, right: tvec2<T>) -> Bool {
    return left.x == right.x && left.y == right.y
}


/*
 +--------------------------------------------------------------------------
 | Functions
 +--------------------------------------------------------------------------
 */

/// Returns the dot product of two vectors
public func dot<T: ArithmeticScalarType> (_ left: tvec2<T>, _ right: tvec2<T>) -> T {
    let a : T = left.x * right.x
    let b : T = left.y * right.y
	return a + b
}

/// Calculates the determinant of the two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func determinant<T: ArithmeticScalarType> (_ left: tvec2<T>, _ right: tvec2<T>) -> T {
    let a : T = left.x * right.y
    let b : T = left.y * right.x
    return a - b
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticIntType> (_ value: tvec2<T>) -> Float {
	return dot(value, value).sqrt()
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticFloatType> (_ value: tvec2<T>) -> T {
	return dot(value, value).sqrt()
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticIntType> (_ value: tvec2<T>) -> vec2f {
	let l : Float = 1 / magnitude(value)
    let x : Float = value.x.toFloat() * l 
    let y : Float = value.y.toFloat() * l
	return vec2f(x, y)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticFloatType> (_ value: tvec2<T>) -> tvec2<T> {
    let invMag : T = T(1) / magnitude(value)
	return value * invMag
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticIntType> (_ left: tvec2<T>, _ right: tvec2<T>) -> Float {
	let value : Float = dot(left, right).toFloat() / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticFloatType> (_ left: tvec2<T>, _ right: tvec2<T>) -> T {
	let value : T = dot(left, right) / (magnitude(left) * magnitude(right))
	return value.acos()
}
