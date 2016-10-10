//
//  vec3.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec3<T: ArithmeticType> : ExpressibleByArrayLiteral, Equatable {
	public typealias ElementType = T
    public typealias SelfType = tvec3<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the dimension of this vector struct
    public static var dim : Int {
        get {return 3}
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        get {return SelfType(1, 0, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        get {return SelfType(0, 1, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e3 : SelfType {
        get {return SelfType(0, 0, 1)}
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
		return SelfType(-value.x, -value.y, -value.z)
	}
	
	/// Sum operator
	/// - parameter left: Left operand
	/// - parameter right: Right operand
	/// - returns: The sum of both operands
	public static func + (left: SelfType, right: SelfType) -> SelfType {
		return SelfType(left.x + right.x, left.y + right.y, left.z + right.z)
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
		return SelfType(left.x * right.x, left.y * right.y, left.z * right.z)
    }
	
	
	/// Multiplies a scalar with a vecotr
	public static func * (left: ElementType, right: SelfType) -> SelfType {
		return SelfType(left * right.x, left * right.y, left * right.z)
	}

	
	/// Multiplies a scalar with a vecotr
	public static func * (left: SelfType, right: ElementType) -> SelfType {
		return right * left
    }
	
	/// Devides the vector by a scalar
	public static func / (left: SelfType, right: ElementType) -> SelfType {
		return SelfType(left.x / right, left.y / right, left.z / right)
    }
    
    
    /// Compound division operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func += (left: inout SelfType, right: SelfType) {
        left = left + right
    }

    
    
    /// Compound division operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func -= (left: inout SelfType, right: SelfType) {
        left = left - right
    }

    
    
    /// Compound division operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The right side of the operation
    public static func *= (left: inout SelfType, right: SelfType) {
        left = left * right
    }

    
    
    /// Compound division operator
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
		return left.x == right.x && left.y == right.y && left.z == right.z
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
		get {return [x, y, z]}
	}
	
	
	/*
	+--------------------------------------------------------------------------
	| Initializers
	+--------------------------------------------------------------------------
	*/
	
	/// Initializes the vector
	/// - parameter x: The x component of the vector
	/// - parameter y: The y component of the vector
	public init (_ x: ElementType, _ y: ElementType, _ z: ElementType) {
		self.x = x
		self.y = y
		self.z = z
	}
	
	
	/// Initializes the vector with an other
	/// - parameters vec: The vector to copy
	public init (_ vec: SelfType) {
		self.init(vec.x, vec.y, vec.z)
	}
    
    
    /// Initializes the vector with a vec2 for x and y and a scalar for z
    /// - parameter vec:
    /// - parameter z:
    public init (_ vec: tvec2<ElementType>, _ z: ElementType) {
        self.init(vec.x, vec.y, z)
    }
    
    
    /// Initializes the vector with a vec2 for x and y and a scalar for z
    /// - parameter vec:
    /// - parameter z:
    public init (_ x: ElementType, _ vec: tvec2<ElementType>) {
        self.init(x, vec.x, vec.y)
    }
	
	
	/// Initializes the vector by setting all components to given value
	/// - parameter value: The value to set
	public init (_ value: ElementType) {
		self.init(value, value, value)
	}
	
	/// Initializes the vector to null vector
	public init () {
		self.init(0, 0, 0)
	}
	
	
	/// Initializes the vector with an array
	public init(arrayLiteral elements: ElementType...) {
		if (elements.count > 0) {x = elements[0]}
		if (elements.count > 1) {y = elements[1]}
		if (elements.count > 2) {z = elements[2]}
	}
}


public typealias vec3i = tvec3<Int>
public typealias vec3f = tvec3<Float>
public typealias vec3d = tvec3<Double>
public typealias vec3 = vec3f

/// Returns the dot product of two vectors
public func dot<T: ArithmeticType> (_ left: tvec3<T>, _ right: tvec3<T>) -> T {
	return left.x * right.x + left.y * right.y + left.z * right.z
}


/// Calculates the determinant of three given vectors
/// - parameter x:
/// - parameter y:
/// - parameter z:
/// - returns: The determinant of the three vectors
public func determinant<T :ArithmeticType> (_ x: tvec3<T>, _ y: tvec3<T>, _ z: tvec3<T>) -> T {
    let a : T = x.x * y.y * z.z + y.x * z.y * x.z + z.x * x.y * y.z
    let b : T = z.x * y.y * x.z + y.x * x.y * z.z + x.x * z.y * y.z
    return a + b
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec3i) -> Float {
	return sqrt(Float(dot(value, value)))
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec3f) -> Float {
	return sqrt(dot(value, value))
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec3d) -> Double {
	return sqrt(dot(value, value))
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec3i) -> vec3f {
	let l = magnitude(value)
	return vec3f(Float(value.x) / l, Float(value.y) / l, Float(value.z) / l)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec3f) -> vec3f {
	return value / magnitude(value)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec3d) -> vec3d {
	return value / magnitude(value)
}


/// Returns the (left hand oriented) normal of the given vectors
/// - parameter left: The left operand (thumb)
/// - parameter right: The right operand (pointer)
/// - returns: The normal vector (middlefinger) which is othogonal to left and right 
public func cross (_ left: vec3f, _ right: vec3f) -> vec3f  {
	return vec3f(
		left.y * right.z - left.z * right.y, 
		left.z * right.x - left.x * right.z, 
		left.x * right.y - left.y * right.x 
	)
}


/// Returns the (left hand oriented) normal of the given vectors
/// - parameter left: The left operand (thumb)
/// - parameter right: The right operand (pointer)
/// - returns: The normal vector (middlefinger) which is othogonal to left and right 
public func cross (_ left: vec3d, _ right: vec3d) -> vec3d  {
	return vec3d(
		left.y * right.z - left.z * right.y, 
		left.z * right.x - left.x * right.z, 
		left.x * right.y - left.y * right.x 
	)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec3i, _ right: vec3i) -> Float {
	let value : Float = Float(dot(left, right)) / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec3f, _ right: vec3f) -> Float {
	let value : Float = dot(left, right) / (magnitude(left) * magnitude(right))
	return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec3d, _ right: vec3d) -> Double {
	let value : Double = dot(left, right) / (magnitude(left) * magnitude(right))
	return acos(value)
}
