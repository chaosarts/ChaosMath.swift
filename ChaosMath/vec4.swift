//
//  vec4.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec4<T: ArithmeticScalarType> : VectorType {

    /// Describes the type of the elements
    public typealias ElementType = T

    /// Describes its own type
    public typealias SelfType = tvec4<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the dimension of this vector struct
    public static var dim : Int {
        return 4
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        return SelfType(1, 0, 0, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        return SelfType(0, 1, 0, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e3 : SelfType {
        return SelfType(0, 0, 1, 0)
    }
    
    /// Provides the second vector of the standard base
    public static var e4 : SelfType {
        return SelfType(0, 0, 0, 1)
    }
    
    /// Provides the identity matrix
    public static var identity : SelfType {
        return SelfType(1)
    }

    
    /*
    +--------------------------------------------------------------------------
    | Stored properties
    +--------------------------------------------------------------------------
    */
    
    /// Provides the x value of the vector
    public var x: ElementType = 0;
    
    /// Provides the y value of the vector
    public var y: ElementType = 0;
    
    /// Provides the z component of the vector
    public var z: ElementType = 0;

    /// Provides the z component of the vector
    public var w: ElementType = 0;
    
    
    /*
    +--------------------------------------------------------------------------
    | Derived properties
    +--------------------------------------------------------------------------
    */
    
    /// Returns the vector as array
    public var array : Array<ElementType> {
        return [x, y, z, w]
    }
    
    
    /*
    +--------------------------------------------------------------------------
    | Initializers
    +--------------------------------------------------------------------------
    */

    
    /// Initializes the vector
    /// - parameter x: The x component of the vector
    /// - parameter y: The y component of the vector
    public init<ForeignType: ArithmeticScalarType> (_ x: ForeignType = 0, _ y: ForeignType = 0, _ z: ForeignType = 0, _ w: ForeignType = 0) {
        self.x = ElementType(x);
        self.y = ElementType(y);
        self.z = ElementType(z);
        self.w = ElementType(w);
    }
    
    
    /// Initializes the vector with an other
    /// - parameters vec: The vector to copy
    public init<ForeignType: ArithmeticScalarType> (_ vec: tvec4<ForeignType>) {
        self.x = ElementType(vec.x);
        self.y = ElementType(vec.y);
        self.z = ElementType(vec.z);
        self.w = ElementType(vec.w);
    }
    
    
    /// Initializes the vector with a vec2, z-  and w-component
    /// - parameter vec: The vector containing the values for x and y
    /// - parameter z: The scalar containing the value for the z component
    /// - parameter w: The scalar containing the value for the w component
    public init (_ vec: tvec2<ElementType>, _ z: ElementType = 0, _ w: ElementType = 0) {
        self.init(vec.x, vec.y, z, w);
    }
    
    
    /// Initializes the vector with a vec2, z-  and w-component
    /// - parameter x: The scalar containing the value for the x component
    /// - parameter vec: The vector containing the values for y and z
    /// - parameter w: The scalar containing the value for the w component
    public init (_ x: ElementType, _ vec: tvec2<ElementType>, _ w: ElementType = 0) {
        self.init(x, vec.x, vec.y, w);
    }
    
    
    /// Initializes the vector with a vec2, z-  and w-component
    /// - parameter x: The scalar containing the value for the x component
    /// - parameter y: The scalar containing the value for the y component
    /// - parameter vec: The vector containing the values for z and w
    public init (_ x: ElementType, _ y: ElementType, _ vec: tvec2<ElementType>) {
        self.init(x, y, vec.x, vec.y);
    }
    
    
    /// Initializes the vector with a vec3 and a valu for the w component
    /// - parameter vec: The vector containing the x, y and z component
    /// - parameter w: A value conatining the w component
    public init (_ vec: tvec3<ElementType>, _ w: ElementType = 0) {
        self.init(vec.x, vec.y, vec.z, w)
    }
    
    
    /// Initializes the vector with a vec3 and a valu for the w component
    /// - parameter x: A value conatining the x component
    /// - parameter vec: The vector containing the y, z and w component
    public init (_ x: ElementType, _ vec: tvec3<ElementType>) {
        self.init(x, vec.x, vec.y, vec.z)
    }
    
    
    /// Implementation of the ExpressibleByIntegerLiteral protocol
    /// - parameter value
    public init(integerLiteral value: Int) {
        let val : ElementType = ElementType(value)
        self.x = val
        self.y = val
        self.z = val
        self.w = val
    }
    
    
    /// Initializes the vector with an array
    public init (arrayLiteral elements: ElementType...) {
        if (elements.count > 0) {x = elements[0]};
        if (elements.count > 1) {y = elements[1]};
        if (elements.count > 2) {z = elements[2]};
        if (elements.count > 3) {z = elements[3]};
    }
}


public typealias vec4i = tvec4<Int>
public typealias vec4f = tvec4<Float>
public typealias vec4d = tvec4<Double>
public typealias vec4 = vec4f


/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */    

/// Negates the vector
/// - parameter value: The vector to be negated
/// - returns: The negated vector
public prefix func -<T: ArithmeticScalarType> (value: tvec4<T>) -> tvec4<T> {
    return tvec4<T>(-value.x, -value.y, -value.z, -value.w)
}

/// Sum operator
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The sum of both operands
public func +<T: ArithmeticScalarType> (left: tvec4<T>, right: tvec4<T>) -> tvec4<T> {
    let x : T = left.x + right.x
    let y : T = left.y + right.y
    let z : T = left.z + right.z
    let w : T = left.w + right.w
    return tvec4<T>(x, y, z, w);
}


/// Returns the difference vector
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func -<T: ArithmeticScalarType> (left: tvec4<T>, right: tvec4<T>) -> tvec4<T> {
    return left + (-right);
}


/// Returns the component wise product
/// - parameter left: Left operand
/// - parameter right: Right operand
/// - returns: The difference of both operands
public func *<T: ArithmeticScalarType> (left: tvec4<T>, right: tvec4<T>) -> tvec4<T> {
    return tvec4<T>(left.x * right.x, left.y * right.y, left.z * right.z, left.w * right.w);
}


/// Multiplies a scalar with a vector
/// - parameter left: The scalar
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tvec4<T>) -> tvec4<T> {
    return tvec4<T>(T(left) * right.x, T(left) * right.y, T(left) * right.z, T(left) * right.w);
}


/// Multiplies a scalar with a vecotr
/// - parameter left: The vector to multiply
/// - parameter right: The multiplicator
/// - returns: The vector multiplied with the scalar
public func *<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec4<T>, right: S) -> tvec4<T> {
    return tvec4<T>(left.x * T(right), left.y * T(right), left.z * T(right), left.w * T(right))
}


/// Devides the vector by a scalar
/// - parameter left: The vector to devide
/// - parameter right: The denominator
/// - returns: The vector devided by the scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tvec4<T>, right: S) -> tvec4<T> {
    return tvec4<T>(left.x / T(right), left.y / T(right), left.z / T(right), left.w / T(right))
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func +=<T: ArithmeticScalarType> (left: inout tvec4<T>, right: tvec4<T>) {
    left = left + right
}



/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func -=<T: ArithmeticScalarType> (left: inout tvec4<T>, right: tvec4<T>) {
    left = left - right
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType> (left: inout tvec4<T>, right: tvec4<T>) {
    left = left * right
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func *=<T: ArithmeticScalarType> (left: inout tvec4<T>, right: T) {
    left = left * right
}


/// Compound division operator
/// - parameter left: The left side of the operation
/// - parameter right: The right side of the operation
public func /=<T: ArithmeticScalarType> (left: inout tvec4<T>, right: T) {
    left = left / right
}


/// Compares two vectors for equality
/// - parameter left: The left side operator
/// - parameter right: The right side operator
/// - returns: True when left and right have component wise equal values
public func ==<T: ArithmeticScalarType> (left: tvec4<T>, right: tvec4<T>) -> Bool {
    return left.x == right.x && left.y == right.y && left.z == right.z && left.w == right.w;
}


/*
 +--------------------------------------------------------------------------
 | Functions
 +--------------------------------------------------------------------------
 */  

/// Returns the dot product of two vectors
public func dot<T: ArithmeticScalarType> (_ left: tvec4<T>, _ right: tvec4<T>) -> T {
    let a : T = left.x * right.x
    let b : T = left.y * right.y
    let c : T = left.z * right.z
    let d : T = left.w * right.w
    return a + b + c + d
}


/// Calculates the determinant of the four vectors
/// - parameter x
/// - parameter y
/// - parameter z
/// - parameter w
/// - return: The determinant
public func determinant<T: ArithmeticScalarType> (_ x: tvec4<T>, _ y: tvec4<T>, _ z: tvec4<T>, _ w: tvec4<T>) -> T {
    let ay0 : tvec3<T> = tvec3<T>(y.y, y.z, y.w)
    let az0 : tvec3<T> = tvec3<T>(z.y, z.z, z.w)
    let aw0 : tvec3<T> = tvec3<T>(w.y, w.z, w.w)
    let detA : T = x.x * determinant(ay0, az0, aw0)
    
    let by0 : tvec3<T> = tvec3<T>(y.x, y.z, y.w)
    let bz0 : tvec3<T> = tvec3<T>(z.x, z.z, z.w)
    let bw0 : tvec3<T> = tvec3<T>(w.x, w.z, w.w)
    let detB : T = x.x * determinant(by0, bz0, bw0)
    
    let cy0 : tvec3<T> = tvec3<T>(y.x, y.y, y.w)
    let cz0 : tvec3<T> = tvec3<T>(z.x, z.y, z.w)
    let cw0 : tvec3<T> = tvec3<T>(w.x, w.y, w.w)
    let detC : T = x.x * determinant(cy0, cz0, cw0)
    
    let dy0 : tvec3<T> = tvec3<T>(y.x, y.y, y.z)
    let dz0 : tvec3<T> = tvec3<T>(z.x, z.y, z.z)
    let dw0 : tvec3<T> = tvec3<T>(w.x, w.y, w.z)
    let detD : T = x.x * determinant(dy0, dz0, dw0)
    
    return detA - detB + detC - detD
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticIntType> (_ value: tvec4<T>) -> Float {
    return dot(value, value).sqrt();
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude<T: ArithmeticFloatType> (_ value: tvec4<T>) -> T {
    return dot(value, value).sqrt();
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticIntType> (_ value: tvec4<T>) -> vec4f {
    let l : Float = magnitude(value);
    return vec4f(value.x.toFloat() / l, value.y.toFloat() / l, value.z.toFloat() / l, value.w.toFloat() / l)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize<T: ArithmeticFloatType> (_ value: tvec4<T>) -> tvec4<T> {
    return value / magnitude(value);
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticIntType> (_ left: tvec4<T>, _ right: tvec4<T>) -> Float {
    let value : Float = dot(left, right).toFloat() / (magnitude(left) * magnitude(right))
    return acos(value)
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle<T: ArithmeticFloatType> (_ left: tvec4<T>, _ right: tvec4<T>) -> T {
    let value : T = dot(left, right) / (magnitude(left) * magnitude(right))
    return value.acos()
}
