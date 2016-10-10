//
//  vec2.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec2<T: ArithmeticType> : ExpressibleByArrayLiteral, Equatable {

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
        get {return 2}
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        get {return SelfType(1, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        get {return SelfType(0, 1)}
    }
	
	/*
	 +--------------------------------------------------------------------------
	 | Operators
	 +--------------------------------------------------------------------------
	 */
	
	
	/// Negates the vector
	/// - parameter value: The vector to be negated
	/// - returns: The negated vector
	public static prefix func - (value: SelfType) -> SelfType {
		return SelfType(-value.x, -value.y)
	}
	
	/// Sum operator
	/// - parameter left: Left operand
	/// - parameter right: Right operand
	/// - returns: The sum of both operands
	public static func + (left: SelfType, right: SelfType) -> SelfType {
		return SelfType(left.x + right.x, left.y + right.y)
	}
	
	
	/// Returns the difference vector
	/// - parameter left: Left operand
	/// - parameter right: Right operand
	/// - returns: The difference of both operands
	public static func - (left: SelfType, right: SelfType) -> SelfType {
		return left + (-right)
    }
	
	
	/// Returns the component wise product
	/// - parameter left: Left operand
	/// - parameter right: Right operand
	/// - returns: The difference of both operands
	public static func * (left: SelfType, right: SelfType) -> SelfType {
		return SelfType(left.x * right.x, left.y * right.y)
    }
	
	
	/// Multiplies a scalar with a vecotr
	public static func * (left: ElementType, right: SelfType) -> SelfType {
		return SelfType(left * right.x, left * right.y)
    }
    
	
	/// Multiplies a scalar with a vecotr
	public static func * (left: SelfType, right: ElementType) -> SelfType {
		return right * left
    }
    
	
	/// Devides the vector by a scalar
    /// - parameter left: The left side of the operator
    /// - parameter right: The right side of the operator
    /// - returns: The vector devided by scalar
	public static func / (left: SelfType, right: ElementType) -> SelfType {
		return SelfType(left.x / right, left.y / right)
	}
    
    
    /// Compund sum operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func += (left: inout SelfType, right: SelfType) {
        left = left + right
    }

    
    
    /// Compound diff operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func -= (left: inout SelfType, right: SelfType) {
        left = left - right
    }

    
    
    /// Compound sum operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func *= (left: inout SelfType, right: SelfType) {
        left = left * right
    }

    
    
    /// Compund sum operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func *= (left: inout SelfType, right: ElementType) {
        left = left * right
    }
    
    
    /// Compound division operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func /= (left: inout SelfType, right: ElementType) {
        left = left / right
    }
    
	
	/// Compares to vectors
	public static func == (left: SelfType, right: SelfType) -> Bool {
		return left.x == right.x && left.y == right.y
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
		get {return [x, y]}
	}
	
	
	/*
	 +--------------------------------------------------------------------------
	 | Initializers
	 +--------------------------------------------------------------------------
	 */
	
	/// Initializes the vector
	/// - parameter x: The x component of the vector
 	/// - parameter y: The y component of the vector
	public init (_ x: ElementType, _ y: ElementType) {
		self.x = x
		self.y = y
	}
	
	
	/// Initializes the vector with an other
	/// - parameters vec: The vector to copy
	public init (_ vec: SelfType) {
		self.init(vec.x, vec.y)
	}
	
	
	/// Initializes the vector by setting all components to given value
	/// - parameter value: The value to set
	public init (_ value: ElementType) {
		self.init(value, value)
	}
	
	/// Initializes the vector to null vector
	public init () {
		self.init(0, 0)
	}
	
	
	/// Initializes the vector with an array
	public init(arrayLiteral elements: ElementType...) {
		if (elements.count > 0) {x = elements[0]}
		if (elements.count > 1) {y = elements[1]}
	}
}


public typealias vec2i = tvec2<Int>
public typealias vec2f = tvec2<Float>
public typealias vec2d = tvec2<Double>
public typealias vec2 = vec2f


/// Returns the dot product of two vectors
public func dot<T: ArithmeticType> (_ left: tvec2<T>, _ right: tvec2<T>) -> T {
	return left.x * right.x + left.y * right.y
}

/// Calculates the determinant of the two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func determinant<T: ArithmeticType> (_ left: tvec2<T>, _ right: tvec2<T>) -> T {
    return left.x * right.y - left.y * right.x
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec2i) -> Float {
	return sqrt(Float(dot(value, value)))
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec2f) -> Float {
	return sqrt(dot(value, value))
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec2d) -> Double {
	return sqrt(dot(value, value))
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec2i) -> vec2f {
	let l = magnitude(value)
	return vec2f(Float(value.x) / l, Float(value.y) / l)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec2f) -> vec2f {
	return value / magnitude(value)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec2d) -> vec2d {
	return value / magnitude(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec2i, _ right: vec2i) -> Float {
	let value : Float = Float(dot(left, right)) / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec2f, _ right: vec2f) -> Float {
	let value : Float = dot(left, right) / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec2d, _ right: vec2d) -> Double {
	let value : Double = dot(left, right) / (magnitude(left) * magnitude(right))
	return acos(value)
}
