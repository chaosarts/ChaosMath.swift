//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat2<T: ArithmeticScalarType> : MatrixType {
    
    /// Describes the type of the components
	public typealias ElementType = T
	
    /// Describes its own type
    public typealias SelfType = tmat2<ElementType>
    
    /// Describes the vector type
    public typealias VectorType = tvec2<ElementType>
	
	/*
	 +--------------------------------------------------------------------------
	 | Static properties
	 +--------------------------------------------------------------------------
	 */
	
	/// Provides the row size of this matrix struct
	public static var rowCount : Int {get {return 2}}
	
	/// Provides the row size of this matrix struct
	public static var colCount : Int {get {return 2}}
	
	/// Provides the identity matrix
	public static var identity : SelfType {get {return SelfType(1)}}
	

	/*
	+--------------------------------------------------------------------------
	| Stored properties
	+--------------------------------------------------------------------------
	*/
	
	/// Provides the matrix as array as row-major
	public private(set) var array : Array<ElementType> = Array<ElementType>(repeating: 0, count: rowCount * colCount)
	
	
	/*
	+--------------------------------------------------------------------------
	| Derived properties
	+--------------------------------------------------------------------------
	*/
	
	/// Provides the determinant of this matrix
	public var det : ElementType {
        return determinant(row(0)!, row(1)!)
	}
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        return [row(0)!, row(1)!]
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
		return [col(0)!, col(1)!]
    }
    
    /// Provides the string representation of the matrix
    public var description: String {
        return array.description
    }
	
	/*
	+--------------------------------------------------------------------------
	| Subscripts
	+--------------------------------------------------------------------------
	*/
	
	/// Subscript to access elements of the matrix
	/// - parameter row: The index of the row to access
	/// - parameter col: The index of the row to access
	/// - returns: The according element
	public subscript (_ row: Int, _ col: Int) -> ElementType {
		get {
			return array[row + col * SelfType.rowCount]
		}
        
        set {
            if row > 0 && row < SelfType.rowCount && col > 0 && col < SelfType.colCount {
                array[row + col * SelfType.rowCount] = newValue
            }
        }
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
	
	
	/// Initializes the matrix with its 4 components
	/// - parameter a11: Component in first row and first column
	/// - parameter a21: Component in second row and first column
	/// - parameter a12: Component in first row and second column
	/// - parameter a22: Component in second row and second column
    public init<ForeignType: ArithmeticScalarType> (_ a11: ForeignType, _ a21: ForeignType, _ a12: ForeignType, _ a22: ForeignType) {
		array = [ElementType(a11), ElementType(a21), ElementType(a12), ElementType(a22)]
	}
	
	
	/// Initializes the a diagonal matrix
	/// - parameter value: The value of the components with index i = j
	public init<ForeignType: ArithmeticScalarType> (_ value: ForeignType = 0) {
        let val : ElementType = ElementType(value);
        array[0] = val
		array[3] = val
	}
	
	
	/// Initializes the matrix with an array
	/// - parameter array: The row-major array to copy
	public init<ForeignType: ArithmeticScalarType> (_ array: Array<ForeignType>) {
		if (array.count > 0) {self.array[0] = ElementType(array[0])}
		if (array.count > 1) {self.array[1] = ElementType(array[1])}
		if (array.count > 2) {self.array[2] = ElementType(array[2])}
		if (array.count > 3) {self.array[3] = ElementType(array[3])}
	}
	
    
    /// Copies the matrice with different or same element type
    /// - parameter mat: The matrix to copy
    public init<ForeignType: ArithmeticScalarType> (_ mat: tmat2<ForeignType>) {
        array = [
            ElementType(mat.array[0]),
            ElementType(mat.array[1]),
            ElementType(mat.array[2]),
            ElementType(mat.array[3])
        ]
    }
	
	/// Initializes the matrix with two column vectors
	/// - parameter a1: The first column
	/// - parameter a2: The second column
	public init<ForeignType: ArithmeticScalarType> (_ a1: tvec2<ForeignType>, _ a2: tvec2<ForeignType>) {
		array = [ElementType(a1.x), ElementType(a1.y), ElementType(a2.x), ElementType(a2.y)]
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init (arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Methods
     +--------------------------------------------------------------------------
     */
    
    
    /// Returns the i-th row of the matrix as vector
    /// - parameter i: The index of the row
    /// - returns: The i-th row of the matrix
    public func row (_ i: Int) -> VectorType? {
    	if i >= 0 && i < SelfType.rowCount {
            return VectorType(array[i], array[i + SelfType.rowCount])
        }
        return nil
    }
    
    /// Returns the i-th col of the matrix as vector
    /// - parameter i: The index of the col
    /// - returns: The i-th col of the matrix
    public func col (_ i: Int) -> VectorType? {
        if i >= 0 && i < SelfType.colCount {
            let baseIndex : Int = i * SelfType.rowCount
            return VectorType(array[baseIndex], array[baseIndex + 1])
        }
        
        return nil
    }
}


public typealias mat2i = tmat2<Int>
public typealias mat2f = tmat2<Float>
public typealias mat2d = tmat2<Double>
public typealias mat2 = mat2f

/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */

/// Negates the given matrix
/// - parameter mat: The matrix to negate
/// - returns: The negated matrix
public prefix func -<T: ArithmeticScalarType> (mat: tmat2<T>) -> tmat2<T> {
    let a11 : T = -mat.array[0]
    let a21 : T = -mat.array[1]
    let a12 : T = -mat.array[2]
    let a22 : T = -mat.array[3]
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calculates the component wise sum of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The sum of the matrices
public func +<T: ArithmeticScalarType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    let a11 : T = left.array[0] + right.array[0]
    let a21 : T = left.array[1] + right.array[1]
    let a12 : T = left.array[2] + right.array[2]
    let a22 : T = left.array[3] + right.array[3]
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calcuates the component wise difference between two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The difference of the matrices
public func -<T: ArithmeticScalarType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    let a11 : T = left.array[0] - right.array[0]
    let a21 : T = left.array[1] - right.array[1]
    let a12 : T = left.array[2] - right.array[2]
    let a22 : T = left.array[3] - right.array[3]
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calculates the product of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrices
public func *<T: ArithmeticScalarType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    var a : T = left.array[0] * right.array[0]
    var b : T = left.array[2] * right.array[1]
    let a11 : T = a + b
    
    a = left.array[1] * right.array[0]
    b = left.array[3] * right.array[1]
    let a21 : T = a + b
    
    a = left.array[0] * right.array[2]
    b = left.array[2] * right.array[3]
    let a12 : T = a + b
    
    a = left.array[1] * right.array[2]
    b = left.array[3] * right.array[3]
    let a22 : T = a + b
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calculates the right side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (vec: tvec2<T>, mat: tmat2<T>) -> tvec2<T> {
    var a : T = vec.x * mat.array[0]
    var b : T = vec.y * mat.array[1]
    let x : T = a + b
    
    a = vec.x * mat.array[2]
    b = vec.y * mat.array[3]
    let y : T = a + b
    
    return tvec2<T>(x, y)
}

/// Calculates the left side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (mat: tmat2<T>, vec: tvec2<T>) -> tvec2<T> {
    var a : T = vec.x * mat.array[0]
    var b : T = vec.y * mat.array[2]
    let x : T = a + b
    
    a = vec.x * mat.array[1]
    b = vec.y * mat.array[3]
    let y : T = a + b
    
    return tvec2<T>(x, y)
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tmat2<T>) -> tmat2<T> {
    let scalar : T = T(left)
    let a11 : T = scalar * right.array[0]
    let a21 : T = scalar * right.array[1]
    let a12 : T = scalar * right.array[2]
    let a22 : T = scalar * right.array[3]
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tmat2<T>, right: S) -> tmat2<T> {
    let scalar : T = T(right)
    let a11 : T  = left.array[0] * scalar
    let a21 : T  = left.array[1] * scalar
    let a12 : T  = left.array[2] * scalar
    let a22 : T  = left.array[3] * scalar
    return tmat2<T>(a11, a21, a12, a22)
}


/// Devides the matrix by the given scalar
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tmat2<T>, right: S) -> tmat2<T> {
    let scalar : T = T(right)
    let a11 : T  = left.array[0] / scalar
    let a21 : T  = left.array[1] / scalar
    let a12 : T  = left.array[2] / scalar
    let a22 : T  = left.array[3] / scalar
    return tmat2<T>(a11, a21, a12, a22)
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter rught: The right operand
public func +=<T: ArithmeticScalarType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left + right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func -=<T: ArithmeticScalarType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left - right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticScalarType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat2<T>, right: S) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func /=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat2<T>, right: S) {
    left = left / right
}


/// Compares to matrices
public func ==<T: ArithmeticScalarType> (left: tmat2<T>, right: tmat2<T>) -> Bool {
    for i in 0..<left.array.count {
        if left.array[i] != right.array[i] {
            return false
        }
    }
    
    return true
}


/*
 +--------------------------------------------------------------------------
 | Functions
 +--------------------------------------------------------------------------
 */


/// Transposes the matrix
/// - parameter mat: The matrix to transpose
/// - returns: The transposed matrix
public func transpose<T: ArithmeticScalarType> (_ mat: tmat2<T>) -> tmat2<T> {
	return tmat2<T>(mat.array[0], mat.array[2], mat.array[1], mat.array[3])
}


/// Inverts the given matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert<T: ArithmeticFloatType> (_ mat: tmat2<T>) throws -> tmat2<T> {
    guard mat.det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let coef : T = 1 / mat.det
    let a11 : T = coef * mat.array[3]
    let a21 : T = -coef * mat.array[1]
    let a12 : T = -coef * mat.array[2]
    let a22 : T = coef * mat.array[0]
    
    return tmat2<T>(a11, a21, a12, a22)
}

/// Inverts the given matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert<T: ArithmeticIntType> (_ mat: tmat2<T>) throws -> tmat2<Float> {
    guard mat.det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let coef : Float = 1.0 / mat.det.toFloat()
    let a11 : Float = coef * mat.array[3].toFloat()
    let a21 : Float = -coef * mat.array[1].toFloat()
    let a12 : Float = -coef * mat.array[2].toFloat()
    let a22 : Float = coef * mat.array[0].toFloat()
    
    return tmat2<Float>(a11, a21, a12, a22)
}
