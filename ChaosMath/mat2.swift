//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat2<T: ArithmeticType> : MatrixType {
    
	public typealias ElementType = T

    public typealias SelfType = tmat2<ElementType>
    
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
	public private(set) var array : Array<ElementType> = Array(repeating: 0, count: 4)
	
	
	/*
	+--------------------------------------------------------------------------
	| Derived properties
	+--------------------------------------------------------------------------
	*/
	
	/// Provides the determinant of this matrix
	public var det : ElementType {
		get {
            do {return try determinant(self.row(0), self.row(1))}
            catch {return 0}
        }
	}
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        get {
            do{return try [row(0), row(1)]}
            catch {return []}
        }
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
        get {
            do {return try [col(0), col(1)]}
            catch {return []}
        }
    }
    
    /// Provides the string representation of the matrix
    public var description: String {
        get {
            var maxlength : Int = 0
            
            for i in 0..<array.count {
                maxlength = max(array[i].description.characters.count, maxlength)
            }
            
            maxlength += 1
            
            var output : String = ""
            let lastColMinIndex = SelfType.colCount * (SelfType.rowCount - 1)
            
            for i in 0..<array.count {
                if i < SelfType.colCount {
                    output += "|"
                    output += pad(array[i], maxlength - array[i].description.characters.count - 1)
                }
                else {
                    output += pad(array[i], maxlength - array[i].description.characters.count)
                }
                
                if i >= lastColMinIndex {
                    output += "|\n"
                }
                
            }
            
            return output
        }
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
	
	
	/// Initializes the matrix with its 4 components
	/// - parameter a11: Component in first row and first column
	/// - parameter a21: Component in second row and first column
	/// - parameter a12: Component in first row and second column
	/// - parameter a22: Component in second row and second column
	public init (_ a11: ElementType, _ a21: ElementType, _ a12: ElementType, _ a22: ElementType) {
		array = [a11, a21, a12, a22]
	}
	
	
	/// Initializes the a diagonal matrix
	/// - parameter value: The value of the components with index i = j
	public init (_ value: ElementType) {
		array = [value, 0, 0, value]
	}
	
	
	/// Initializes the null matrix
	public init () {
		self.init(0, 0, 0, 0)
	}
	
	
	/// Initializes the matrix with an array
	/// - parameter array: The row-major array to copy
	public init (_ array: Array<ElementType>) {
		self.init(0, 0, 0, 0)
		if (array.count > 0) {self.array[0] = array[0]}
		if (array.count > 1) {self.array[1] = array[1]}
		if (array.count > 2) {self.array[2] = array[2]}
		if (array.count > 3) {self.array[3] = array[3]}
	}
	
	
	/// Initializer for ExpressableByArrayLiteral
	public init(arrayLiteral elements: ElementType...) {
		self.init(elements)
	}
	
	
	/// Initializes the matrix with two column vectors
	/// - parameter a1: The first column
	/// - parameter a2: The second column
	public init (_ a1: VectorType, _ a2: VectorType) {
		array = a1.array
		array.append(contentsOf: a2.array)
	}
    
    
    /// Returns the i-th row of the matrix as vector
    /// - parameter i: The index of the row
    /// - returns: The i-th row of the matrix
    public func row (_ i: Int) throws -> VectorType {
    	guard i >= 0 && i < SelfType.rowCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        return VectorType(array[i], array[i + SelfType.rowCount])
    }
    
    /// Returns the i-th col of the matrix as vector
    /// - parameter i: The index of the col
    /// - returns: The i-th col of the matrix
    public func col (_ i: Int) throws -> VectorType {
        guard i >= 0 && i < SelfType.colCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        let baseIndex : Int = i * SelfType.rowCount
		return VectorType(array[baseIndex], array[baseIndex + 1])
    }
}


extension tmat2 where T: ArithmeticFloatType {
    public init<S: ArithmeticIntType> (_ mat: tmat2<S>) {
        self.init(T(mat.array[0]), T(mat.array[1]), T(mat.array[2]), T(mat.array[3]))
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
public prefix func -<T: ArithmeticType> (mat: tmat2<T>) -> tmat2<T> {
    return tmat2<T>(-mat[0,0], -mat[1,0], -mat[1,0], -mat[1,1])
}


/// Calculates the component wise sum of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The sum of the matrices
public func +<T: ArithmeticType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    return tmat2<T>(left.array[0] + right.array[0],
                    left.array[1] + right.array[1],
                    left.array[2] + right.array[2],
                    left.array[3] + right.array[3]
    )
}


/// Calcuates the component wise difference between two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The difference of the matrices
public func -<T: ArithmeticType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    return left - right
}


/// Calculates the product of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrices
public func *<T: ArithmeticType> (left: tmat2<T>, right: tmat2<T>) -> tmat2<T> {
    let a11 : T = left.array[0] * right.array[0] + left.array[2] * right.array[1]
    let a21 : T = left.array[1] * right.array[0] + left.array[3] * right.array[1]
    let a12 : T = left.array[0] * right.array[2] + left.array[2] * right.array[3]
    let a22 : T = left.array[1] * right.array[2] + left.array[3] * right.array[3]
    
    return tmat2<T>(a11, a21, a12, a22)
}


/// Calculates the right side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticType> (vec: tvec2<T>, mat: tmat2<T>) -> tvec2<T> {
    return tvec2<T>(vec.x * mat.array[0] + vec.y * mat.array[1],
                         vec.x * mat.array[2] + vec.y * mat.array[3])
}

/// Calculates the left side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticType> (mat: tmat2<T>, vec: tvec2<T>) -> tvec2<T> {
    return tvec2<T>(vec.x * mat.array[0] + vec.y * mat.array[2],
                         vec.x * mat.array[1] + vec.y * mat.array[3])
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<T: ArithmeticType> (left: T, right: tmat2<T>) -> tmat2<T> {
    return tmat2<T>(left * right.array[0], left * right.array[1], left * right.array[2], left * right.array[3])
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<T: ArithmeticType> (left: tmat2<T>, right: T) -> tmat2<T> {
    return right * left
}


/// Devides the matrix by the given scalar
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func /<T: ArithmeticType> (left: tmat2<T>, right: T) -> tmat2<T> {
    return tmat2<T>(left.array[0] / right, left.array[1] / right, left.array[2] / right, left.array[3] / right)
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter rught: The right operand
public func +=<T: ArithmeticType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left + right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func -=<T: ArithmeticType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left - right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticType> (left: inout tmat2<T>, right: tmat2<T>) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticType> (left: inout tmat2<T>, right: T) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func /=<T: ArithmeticType> (left: inout tmat2<T>, right: T) {
    left = left / right
}


/// Compares to matrices
public func ==<T: ArithmeticType> (left: tmat2<T>, right: tmat2<T>) -> Bool {
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
public func transpose<T: ArithmeticType> (_ mat: tmat2<T>) -> tmat2<T> {
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
    return tmat2<T>(
        coef * mat.array[3],
        -coef * mat.array[1],
        -coef * mat.array[2],
        coef * mat.array[0]
    )
}

/// Inverts the given matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert<T: ArithmeticIntType> (_ mat: tmat2<T>) throws -> tmat2<Float> {
    guard mat.det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let coef : Float = 1.0 / mat.det.toFloat()
    return tmat2<Float>(
        coef * mat.array[3].toFloat(),
        -coef * mat.array[3].toFloat(),
        -coef * mat.array[3].toFloat(),
        coef * mat.array[3].toFloat()
    )
}
