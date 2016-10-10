//
//  vec4.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tvec4<T: ArithmeticType> : ExpressibleByArrayLiteral, Equatable {

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
        get {return 4}
    }
    
    /// Provides the first vector of the standard base
    public static var e1 : SelfType {
        get {return SelfType(1, 0, 0, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e2 : SelfType {
        get {return SelfType(0, 1, 0, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e3 : SelfType {
        get {return SelfType(0, 0, 1, 0)}
    }
    
    /// Provides the second vector of the standard base
    public static var e4 : SelfType {
        get {return SelfType(0, 0, 0, 1)}
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
        return SelfType(-value.x, -value.y, -value.z, -value.w)
    }
    
    /// Sum operator
    /// - parameter left: Left operand
    /// - parameter right: Right operand
    /// - returns: The sum of both operands
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.x + right.x, left.y + right.y, left.z + right.z, left.w + right.w);
    }
    
    
    /// Returns the difference vector
    /// - parameter left: Left operand
    /// - parameter right: Right operand
    /// - returns: The difference of both operands
    public static func - (left: SelfType, right: SelfType) -> SelfType {
        return left + (-right);
    }
    
    
    /// Returns the component wise product
    /// - parameter left: Left operand
    /// - parameter right: Right operand
    /// - returns: The difference of both operands
    public static func * (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.x * right.x, left.y * right.y, left.z * right.z, left.w * right.w);
    }
    
    
    /// Multiplies a scalar with a vector
    /// - parameter left: The scalar
    public static func * (left: ElementType, right: SelfType) -> SelfType {
        return SelfType(left * right.x, left * right.y, left * right.z, left * right.w);
    }
    
    
    /// Multiplies a scalar with a vecotr
    public static func * (left: SelfType, right: ElementType) -> SelfType {
        return right * left;
    }

    
    /// Devides the vector by a scalar
    public static func / (left: SelfType, right: ElementType) -> SelfType {
        return SelfType(left.x / right, left.y / right, left.z / right, left.w / right)
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
    
    /// Compares two vectors for equality
    /// - parameter left: The left side operator
    /// - parameter right: The right side operator
    /// - returns: True when left and right have component wise equal values
    public static func == (left: SelfType, right: SelfType) -> Bool {
        return left.x == right.x && left.y == right.y && left.z == right.z && left.w == right.w;
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
        get {return [x, y, z, w]}
    }
    
    
    /*
    +--------------------------------------------------------------------------
    | Initializers
    +--------------------------------------------------------------------------
    */
    
    /// Initializes the vector
    /// - parameter x: The x component of the vector
    /// - parameter y: The y component of the vector
    public init (_ x: ElementType, _ y: ElementType, _ z: ElementType, _ w: ElementType) {
        self.x = x;
        self.y = y;
        self.z = z;
        self.w = w;
    }
    
    
    /// Initializes the vector with an other
    /// - parameters vec: The vector to copy
    public init (_ vec: SelfType) {
        self.init(vec.x, vec.y, vec.z, vec.w);
    }
    
    
    /// Initializes the vector with a vec2, z-  and w-component
    /// - parameter vec: The vector containing the values for x and y
    /// - parameter z: The scalar containing the value for the z component
    /// - parameter w: The scalar containing the value for the w component
    public init (_ vec: tvec2<ElementType>, _ z: ElementType, _ w: ElementType) {
        self.init(vec.x, vec.y, z, w);
    }
    
    
    /// Initializes the vector with a vec2, z-  and w-component
    /// - parameter x: The scalar containing the value for the x component
    /// - parameter vec: The vector containing the values for y and z
    /// - parameter w: The scalar containing the value for the w component
    public init (_ x: ElementType, _ vec: tvec2<ElementType>, _ w: ElementType) {
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
    public init (_ vec: tvec3<ElementType>, _ w: ElementType) {
        self.init(vec.x, vec.y, vec.z, w)
    }
    
    
    /// Initializes the vector with a vec3 and a valu for the w component
    /// - parameter x: A value conatining the x component
    /// - parameter vec: The vector containing the y, z and w component
    public init (_ x: ElementType, _ vec: tvec3<ElementType>) {
        self.init(x, vec.x, vec.y, vec.z)
    }
    
    
    /// Initializes the vector by setting all components to given value
    /// - parameter value: The value to set
    public init (_ value: ElementType) {
        self.init(value, value, value, value);
    }
    
    /// Initializes the vector to null vector
    public init () {
        self.init(0, 0, 0, 0);
    }
    
    
    /// Initializes the vector with an array
    public init(arrayLiteral elements: ElementType...) {
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

/// Returns the dot product of two vectors
public func dot<T: ArithmeticType> (_ left: tvec4<T>, _ right: tvec4<T>) -> T {
    return left.x * right.x + left.y * right.y + left.z * right.z + left.z * right.z;
}


/// Calculates the determinant of the four vectors
/// - parameter x
/// - parameter y
/// - parameter z
/// - parameter w
/// - return: The determinant
public func determinant<T: ArithmeticType> (_ x: tvec4<T>, _ y: tvec4<T>, _ z: tvec4<T>, _ w: tvec4<T>) -> T {
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
public func magnitude (_ value: vec4i) -> Float {
    return sqrt(Float(dot(value, value)));
}

/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec4f) -> Float {
    return sqrt(dot(value, value));
}


/// Returns the magnitude of the vector
/// - parameter value: The vector to calculate the magnitude from
/// - returns: The magnitude of the vector
public func magnitude (_ value: vec4d) -> Double {
    return sqrt(dot(value, value));
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec4i) -> vec4f {
    let l = magnitude(value);
    return vec4f(Float(value.x) / l, Float(value.y) / l, Float(value.z) / l, Float(value.w) / l)
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec4f) -> vec4f {
    return value / magnitude(value);
}


/// Normalizes the vector
/// - parameter value: The vector to normalize
/// - returns: The normalized vector
public func normalize (_ value: vec4d) -> vec4d {
    return value / magnitude(value);
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec4i, _ right: vec4i) -> Float {
    let value : Float = Float(dot(left, right)) / (magnitude(left) * magnitude(right))
    return acos(value);
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec4f, _ right: vec4f) -> Float {
    let value : Float = dot(left, right) / (magnitude(left) * magnitude(right))
    return acos(value);
}


/// Calculates the angle between two vectors
/// - parameter left
/// - parameter right
/// - returns: The angle in radian
public func angle (_ left: vec4d, _ right: vec4d) -> Double {
    let value : Double = dot(left, right) / (magnitude(left) * magnitude(right))
    return acos(value);
}
