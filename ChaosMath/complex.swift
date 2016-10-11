//
//  complex.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 10/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tcomplex<T: ArithmeticType> : ExpressibleByArrayLiteral, Equatable {
    
    public typealias ElementType = T
    public typealias SelfType = tcomplex<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Operators
     +--------------------------------------------------------------------------
     */
    
    /// Negates the complex number
    public static prefix func - (_ c: SelfType) -> SelfType {
        return SelfType(-c.r, -c.i)
    }
    
    /// Sum operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    /// - returns: The sum of two complex numbers
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.r + right.r, left.i + right.i)
    }
    
    
    /// Substraction operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    /// - returns: The sum of two complex numbers
    public static func - (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.r - right.r, left.i - right.i)
    }
    
    
    /// Substraction operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    /// - returns: The sum of two complex numbers
    public static func * (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(left.r * right.r - left.i * right.i, left.r * right.i + left.i * right.r)
    }
    
    
    /// Substraction operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    /// - returns: The sum of two complex numbers
    public static func / (left: SelfType, right: SelfType) -> SelfType {
        let one : ElementType = 1
        let frac : ElementType = one / (right.r * right.r + right.i * right.i)
        
        let real : ElementType = left.r * right.r + left.i * right.i
        let imaginary : ElementType = left.i * right.r - left.r * right.i
        return SelfType(real / frac, imaginary / frac)
    }
    
    
    /// Compund sum operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    public static func += (left: inout SelfType, right: SelfType) {
        left = left + right
    }
    
    
    /// Compund diff operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    public static func -= (left: inout SelfType, right: SelfType) {
        left = left - right
    }
    
    
    /// Compund multiplication operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    public static func *= (left: inout SelfType, right: SelfType) {
        left = left * right
    }
    
    
    /// Compund division operator
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    public static func /= (left: inout SelfType, right: SelfType) {
        left = left / right
    }
    
    
    /// Compares two complex numbers for equality
    /// - parameter left: The left side of the operation
    /// - parameter right: The left side of the operation
    /// - returns: True, if the components are equal
    public static func == (left: SelfType, right: SelfType) -> Bool {
        return left.r == right.r && left.i == right.i
    }
    
    
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
        get {return [r, i]}
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the complex number with r and i
    /// - parameter r: The real part of the complex number
    /// - parameter i: The imaginary part of the complex number
    public init (_ r: ElementType, _ i: ElementType) {
        self.r = r
        self.i = i
    }
    
    
    /// Initializes the neutral element
    public init () {
        self.init(0, 0)
    }
    
    
    /// Initializes the complex number with only the real part
    /// - parameter r: The real part
    public init (r: ElementType) {
        self.init(r, 0)
    }
    
    
    /// Initializes the complex number with only the real part
    /// - parameter r: The real part
    public init (i: ElementType) {
        self.init(0, i)
    }
    
    
    /// Copy constructor
    /// - parameter c: A complex number to copy
    public init (_ c: SelfType) {
        self.init(c.r, c.i)
    }
    
    
    /// Copies the first two elements of the array, if set
    /// - parameter array: The array to copy values from
    public init (_ array: Array<ElementType>) {
        self.r = array.count > 0 ? array[0] : 0
        self.i = array.count > 1 ? array[1] : 0
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init(arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
}


extension tcomplex where T: ArithmeticFloatType {
    public init<S: ArithmeticIntType> (_ c: tcomplex<S>) {
        self.init(T(c.r), T(c.i))
    }
}

public typealias complexi = tcomplex<Int>
public typealias complexf = tcomplex<Float>
public typealias complexd = tcomplex<Double>
public typealias complex = complexf


/// Returns the conjugate of the complex number
public func conjugate<T: ArithmeticType> (_ c: tcomplex<T>) -> tcomplex<T> {
    return tcomplex<T>(c.r, -c.i)
}


/// Calculates the magnitude of a complex number
public func magnitude<T: ArithmeticIntType> (_ c: tcomplex<T>) -> Float {
    return (c.r * c.r + c.i * c.i).squareRoot()
}


/// Calculates the magnitude of a complex number
public func magnitude<T: ArithmeticFloatType> (_ c: tcomplex<T>) -> T {
    return (c.r * c.r + c.i * c.i).squareRoot()
}
