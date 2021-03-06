//
//  complex.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tcomplex<T: ArithmeticScalarType> : ExpressibleByArrayLiteral, Equatable {
    
    /// Describes the type of the elements
    public typealias ElementType = T

    /// Describe its own type
    public typealias SelfType = tcomplex<ElementType>
    
    /*
  	 +--------------------------------------------------------------------------
     | Stored properties
 	 +--------------------------------------------------------------------------
 	 */
    
    /// Provides the real component of the complex number
    public var r : ElementType
    
    /// Provides the imaginary part of the complex number
    public var i : ElementType

    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the complex number as list
    public var array : Array<ElementType> {
        return [r, i]
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the complex number with r and i
    /// - parameter r: The real part of the complex number
    /// - parameter i: The imaginary part of the complex number
    public init<ForeignType: ArithmeticScalarType> (_ r: ForeignType = 0, _ i: ForeignType = 0) {
        self.r = ElementType(r)
        self.i = ElementType(i)
    }
    
    
    /// Initializes the complex number with only the real part
    /// - parameter r: The real part
    public init<ForeignType: ArithmeticScalarType> (r: ForeignType) {
        self.init(ElementType(r), 0)
    }
    
    
    /// Initializes the complex number with only the real part
    /// - parameter r: The real part
    public init<ForeignType: ArithmeticScalarType>(i: ForeignType) {
        self.init(0, ElementType(i))
    }
    
    
    /// Copy constructor
    /// - parameter c: A complex number to copy
    public init<ForeignType: ArithmeticScalarType> (_ c: tcomplex<ForeignType>) {
        self.init(c.r, c.i)
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init (arrayLiteral elements: ElementType...) {
        let count : Int = elements.count
        var r : ElementType = 0
        var i : ElementType = 0
        
        if count > 0 {r = elements[0]}
        if count > 1 {i = elements[1]}
        
        self.r = r
        self.i = i
    }
}

public typealias complexi = tcomplex<Int>
public typealias complexf = tcomplex<Float>
public typealias complexd = tcomplex<Double>
public typealias complex = complexf

 /*
  +--------------------------------------------------------------------------
  | Operators
  +--------------------------------------------------------------------------
  */
    
/// Negates the complex number
public prefix func -<T: ArithmeticScalarType>(_ c: tcomplex<T>) -> tcomplex<T> {
    return tcomplex<T>(-c.r, -c.i)
}

/// Sum operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
/// - returns: The sum of two complex numbers
public func + <T: ArithmeticScalarType>(left: tcomplex<T>, right: tcomplex<T>) -> tcomplex<T> {
    return tcomplex<T>(left.r + right.r, left.i + right.i)
}


/// Substraction operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
/// - returns: The sum of two complex numbers
public func - <T: ArithmeticScalarType>(left: tcomplex<T>, right: tcomplex<T>) -> tcomplex<T> {
    return tcomplex<T>(left.r - right.r, left.i - right.i)
}


/// Substraction operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
/// - returns: The sum of two complex numbers
public func * <T: ArithmeticScalarType>(left: tcomplex<T>, right: tcomplex<T>) -> tcomplex<T> {
    let r_a : T = left.r * right.r
    let r_b : T = left.i * right.i
    let r : T =  r_a - r_b
    
    let i_a : T = left.r * right.i
    let i_b : T = left.i * right.r
	let i : T = i_a + i_b
    
    return tcomplex<T>(r, i)
}


/// Substraction operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
/// - returns: The sum of two complex numbers
public func / <T: ArithmeticScalarType>(left: tcomplex<T>, right: tcomplex<T>) -> tcomplex<T> {
    let one : T = 1
    
    let frac_a : T = right.r * right.r
    let frac_b : T = right.i * right.i
    let frac : T = one / (frac_a + frac_b)
    
    let real_a : T = left.r * right.r
    let real_b : T = left.i * right.i
    let real : T = real_a + real_b
    
    let imaginary_a : T = left.i * right.r
    let imaginary_b : T = left.r * right.i
    let imaginary : T = imaginary_a - imaginary_b
    
    return tcomplex<T>(real * frac, imaginary * frac)
}


/// Compund sum operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
public func +=<T: ArithmeticScalarType> (left: inout tcomplex<T>, right: tcomplex<T>) {
    left = left + right
}


/// Compund diff operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
public func -=<T: ArithmeticScalarType> (left: inout tcomplex<T>, right: tcomplex<T>) {
    left = left - right
}


/// Compund multiplication operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
public func *=<T: ArithmeticScalarType> (left: inout tcomplex<T>, right: tcomplex<T>) {
    left = left * right
}


/// Compund division operator
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
public func /=<T: ArithmeticScalarType> (left: inout tcomplex<T>, right: tcomplex<T>) {
    left = left / right
}


/// Compares two complex numbers for equality
/// - parameter left: The left side of the operation
/// - parameter right: The left side of the operation
/// - returns: True, if the components are equal
public func ==<T: ArithmeticScalarType> (left: tcomplex<T>, right: tcomplex<T>) -> Bool {
    return left.r == right.r && left.i == right.i
}



/*
+--------------------------------------------------------------------------
| Operators
+--------------------------------------------------------------------------
*/

/// Returns the conjugate of the complex number
public func conjugate<T: ArithmeticScalarType> (_ c: tcomplex<T>) -> tcomplex<T> {
    return tcomplex<T>(c.r, -c.i)
}


/// Calculates the magnitude of a complex number
public func magnitude<T: ArithmeticIntType> (_ c: tcomplex<T>) -> Float {
    let r2 : T = c.r * c.r
    let i2 : T = c.i * c.i
    
    return (r2 + i2).sqrt()
}


/// Calculates the magnitude of a complex number
public func magnitude<T: ArithmeticFloatType> (_ c: tcomplex<T>) -> T {
    let r2 : T = c.r * c.r
    let i2 : T = c.i * c.i
    
    return (r2 + i2).sqrt()
}
