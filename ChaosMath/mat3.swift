//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat3<T: ArithmeticScalarType> : MatrixType {

    public typealias ElementType = T

    public typealias SelfType = tmat3<ElementType>
    
    public typealias VectorType = tvec3<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the row size of this matrix struct
    public static var rowCount : Int {get {return 3}}
    
    /// Provides the row size of this matrix struct
    public static var colCount : Int {get {return 3}}
    
    /// Provides the identity matrix
    public static var identity : SelfType {get {return SelfType(1)}}
    
    
    /*
    +--------------------------------------------------------------------------
    | Stored properties
    +--------------------------------------------------------------------------
    */
    
    /// Provides the matrix as array as column major
    public private(set) var array : Array<ElementType> = Array<ElementType>(repeating: 0, count: rowCount * colCount)
    
    
    /*
    +--------------------------------------------------------------------------
    | Derived properties
    +--------------------------------------------------------------------------
    */
    
    /// Provides the determinant of this matrix
    public var det : ElementType {
        return determinant(col(0)!, col(1)!, col(2)!)
    }
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        return [row(0)!, row(1)!, row(2)!]
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
        return [col(0)!, col(1)!, col(2)!]
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
    public init<ForeignType: ArithmeticScalarType> (_ a11: ForeignType, _ a21: ForeignType, _ a31: ForeignType,
        _ a12: ForeignType, _ a22: ForeignType, _ a32: ForeignType,
        _ a13: ForeignType, _ a23: ForeignType, _ a33: ForeignType) {
        array = [
            ElementType(a11), ElementType(a21), ElementType(a31),
            ElementType(a12), ElementType(a22), ElementType(a32),
            ElementType(a13), ElementType(a23), ElementType(a33)
        ]
    }
    
    
    /// Initializes the a diagonal matrix
    /// - parameter value: The value of the components with index i = j
    public init<ForeignType: ArithmeticScalarType> (_ value: ForeignType = 0) {
        let val : ElementType = ElementType(value)
        array[0] = val
        array[4] = val
        array[8] = val
    }
    
    
    /// Initializes the matrix with an array
    /// - parameter array: The row-major array to copy
    public init<ForeignType: ArithmeticScalarType> (_ array: Array<ForeignType>) {
        if (array.count > 0) {self.array[0] = ElementType(array[0])}
        if (array.count > 1) {self.array[1] = ElementType(array[1])}
        if (array.count > 2) {self.array[2] = ElementType(array[2])}
        if (array.count > 3) {self.array[3] = ElementType(array[3])}
        if (array.count > 4) {self.array[4] = ElementType(array[4])}
        if (array.count > 5) {self.array[5] = ElementType(array[5])}
        if (array.count > 6) {self.array[6] = ElementType(array[6])}
        if (array.count > 7) {self.array[7] = ElementType(array[7])}
        if (array.count > 8) {self.array[8] = ElementType(array[8])}
    }
    
    
    /// Initializes the matrix with three column vectors
    /// - parameter a1: The first column
    /// - parameter a2: The second column
    public init<ForeignType: ArithmeticScalarType> (_ a1: tvec3<ForeignType>, _ a2: tvec3<ForeignType>, _ a3: tvec3<ForeignType>) {
        array[0] = ElementType(a1.x)
        array[1] = ElementType(a1.y)
        array[2] = ElementType(a1.z)
        array[3] = ElementType(a2.x)
        array[4] = ElementType(a2.y)
        array[5] = ElementType(a2.z)
        array[6] = ElementType(a3.x)
        array[7] = ElementType(a3.y)
        array[8] = ElementType(a3.z)
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
    
    
    /// Returns the components of the i-th row as vector
    /// - parameter i: Index of the row to return
    /// - returns: The row vector at index i
    public func row (_ i: Int) -> VectorType? {
		if i >= 0 && i < SelfType.rowCount {
            return VectorType(array[i], array[i + SelfType.colCount], array[i + SelfType.colCount + SelfType.colCount])
        }
        
        return nil
    }
    
    
    /// Returns the components of the i-th col as vector
    /// - parameter i: Index of the column to return
    /// - returns: The column vector at index i
    public func col (_ i: Int) -> VectorType? {
        if i >= 0 && i < SelfType.rowCount {
            let baseIndex : Int = i * SelfType.rowCount
            return VectorType(array[baseIndex], array[baseIndex + 1], array[baseIndex + 2])
        }
        
        return nil
    }

	
    /// Returns the 2x2 submatrix by leaving out the i-th row and j-th column
    /// - parameter i: Index of the i the row
    /// - parameter j: Index of the j the row
    /// - returns: The submatrix
    public func submatrix (_ i: Int, j: Int) -> tmat2<T>? {
        switch (i, j) {
            case (0, 0): return tmat2<T>(array[4], array[5], array[7], array[8])
            case (1, 0): return tmat2<T>(array[3], array[5], array[6], array[8])
            case (2, 0): return tmat2<T>(array[3], array[4], array[6], array[7])
            case (0, 1): return tmat2<T>(array[1], array[2], array[7], array[8])
            case (1, 1): return tmat2<T>(array[0], array[2], array[6], array[8])
            case (2, 1): return tmat2<T>(array[0], array[1], array[6], array[7])
            case (0, 2): return tmat2<T>(array[1], array[2], array[4], array[5])
            case (1, 2): return tmat2<T>(array[0], array[2], array[3], array[5])
            case (2, 2): return tmat2<T>(array[0], array[1], array[3], array[4])
            default: return nil
        }
    }
}


public typealias mat3i = tmat3<Int>
public typealias mat3f = tmat3<Float>
public typealias mat3d = tmat3<Double>
public typealias mat3 = mat3f


/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */

/// Negates the given matrix
/// - parameter mat: The matrix to negate
/// - returns: The negated matrix
public prefix func -<T: ArithmeticScalarType> (mat: tmat3<T>) -> tmat3<T> {
    let a11 : T = -mat.array[0]
    let a21 : T = -mat.array[1]
    let a31 : T = -mat.array[2]
    let a12 : T = -mat.array[3]
    let a22 : T = -mat.array[4]
    let a32 : T = -mat.array[5]
    let a13 : T = -mat.array[6]
    let a23 : T = -mat.array[7]
    let a33 : T = -mat.array[8]

    return tmat3<T>(a11, a21, a31, a12, a22, a32, a13, a23, a33)
}


/// Calculates the component wise sum of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The sum of the matrices
public func +<T: ArithmeticScalarType> (left: tmat3<T>, right: tmat3<T>) -> tmat3<T> {
    let a11 : T = left.array[0] + right.array[0]
    let a21 : T = left.array[1] + right.array[1]
    let a31 : T = left.array[2] + right.array[2]
    let a12 : T = left.array[3] + right.array[3]
    let a22 : T = left.array[4] + right.array[4]
    let a32 : T = left.array[5] + right.array[5]
    let a13 : T = left.array[6] + right.array[6]
    let a23 : T = left.array[7] + right.array[7]
    let a33 : T = left.array[8] + right.array[8]

    return tmat3<T>(a11, a21, a31, a12, a22, a32, a13, a23, a33)
}


/// Calcuates the component wise difference between two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The difference of the matrices
public func -<T: ArithmeticScalarType> (left: tmat3<T>, right: tmat3<T>) -> tmat3<T> {
    return left - right
}


/// Calculates the product of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrices
public func *<T: ArithmeticScalarType> (left: tmat3<T>, right: tmat3<T>) -> tmat3<T> {

    var a : T = left.array[0] * right.array[0]
    var b : T = left.array[3] * right.array[1]
    var c : T = left.array[6] * right.array[2]
    let a11 : T = a + b + c

    a = left.array[1] * right.array[0]
    b = left.array[4] * right.array[1]
    c = left.array[7] * right.array[2]
    let a21 : T = a + b + c

    a = left.array[2] * right.array[0]
    b = left.array[5] * right.array[1]
    c = left.array[8] * right.array[2]
    let a31 : T = a + b + c

    
    a = left.array[0] * right.array[3]
    b = left.array[3] * right.array[4]
    c = left.array[6] * right.array[5]
    let a12 : T = a + b + c

    a = left.array[1] * right.array[3]
    b = left.array[4] * right.array[4]
    c = left.array[7] * right.array[5]
    let a22 : T = a + b + c

    a = left.array[2] * right.array[3]
    b = left.array[5] * right.array[4]
    c = left.array[8] * right.array[5]
    let a32 : T = a + b + c

    
    a = left.array[0] * right.array[6]
    b = left.array[3] * right.array[7]
    c = left.array[6] * right.array[8]
    let a13 : T = a + b + c

    a = left.array[1] * right.array[6]
    b = left.array[4] * right.array[7]
    c = left.array[7] * right.array[8]
    let a23 : T = a + b + c

    a = left.array[2] * right.array[6]
    b = left.array[5] * right.array[7]
    c = left.array[8] * right.array[8]
    let a33 : T = a + b + c

    
    return tmat3<T>(a11, a12, a13, a21, a22, a23, a31, a32, a33)
}


/// Calculates the right side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (vec: tvec3<T>, mat: tmat3<T>) -> tvec3<T> {
    var x : T = 0, y : T = 0, z : T = 0
    x += vec.x * mat.array[0]
    x += vec.y * mat.array[1]
    x += vec.z * mat.array[2]
    
    y += vec.x * mat.array[3]
    y += vec.y * mat.array[4]
    y += vec.z * mat.array[5]
    
    z += vec.x * mat.array[6]
    z += vec.y * mat.array[7]
    z += vec.z * mat.array[8]
    
    return tvec3<T>(x, y, z)
}

/// Calculates the left side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (mat: tmat3<T>, vec: tvec3<T>) -> tvec3<T> {
    var x : T = 0, y : T = 0, z : T = 0
    
    x += vec.x * mat.array[0]
    x += vec.y * mat.array[3]
    x += vec.z * mat.array[6]
    
    y += vec.x * mat.array[1]
    y += vec.y * mat.array[4]
    y += vec.z * mat.array[7]
    
    z += vec.x * mat.array[2]
    z += vec.y * mat.array[5]
    z += vec.z * mat.array[8]
    
    return tvec3<T>(x, y, z)
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tmat3<T>) -> tmat3<T> {

    let scalar : T = T(left)

    let a11 : T = scalar * right.array[0]
    let a21 : T = scalar * right.array[1]
    let a31 : T = scalar * right.array[2]
    
    let a12 : T = scalar * right.array[3]
    let a22 : T = scalar * right.array[4]
    let a32 : T = scalar * right.array[5]
    
    let a13 : T = scalar * right.array[6]
    let a23 : T = scalar * right.array[7]
    let a33 : T = scalar * right.array[8]
    
    return tmat3<T>(a11, a12, a13, a21, a22, a23, a31, a32, a33)
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<T: ArithmeticScalarType> (left: tmat3<T>, right: T) -> tmat3<T> {
    let scalar : T = T(right)

    let a11 : T = left.array[0] * scalar
    let a21 : T = left.array[1] * scalar
    let a31 : T = left.array[2] * scalar
    
    let a12 : T = left.array[3] * scalar
    let a22 : T = left.array[4] * scalar
    let a32 : T = left.array[5] * scalar
    
    let a13 : T = left.array[6] * scalar
    let a23 : T = left.array[7] * scalar
    let a33 : T = left.array[8] * scalar
    
    return tmat3<T>(a11, a12, a13, a21, a22, a23, a31, a32, a33)
}


/// Devides the matrix by the given scalar
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tmat3<T>, right: S) -> tmat3<T> {
    let scalar : T = T(1) / T(right)
    let a11 : T = left.array[0] * scalar
    let a21 : T = left.array[1] * scalar
    let a31 : T = left.array[2] * scalar
    let a12 : T = left.array[3] * scalar
    let a22 : T = left.array[4] * scalar
    let a32 : T = left.array[5] * scalar
    let a13 : T = left.array[6] * scalar
    let a23 : T = left.array[7] * scalar
    let a33 : T = left.array[8] * scalar
    return tmat3<T>(a11, a12, a13, a21, a22, a23, a31, a32, a33)
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter rught: The right operand
public func +=<T: ArithmeticScalarType> (left: inout tmat3<T>, right: tmat3<T>) {
    left = left + right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func -=<T: ArithmeticScalarType> (left: inout tmat3<T>, right: tmat3<T>) {
    left = left - right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticScalarType> (left: inout tmat3<T>, right: tmat3<T>) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func *=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat3<T>, right: S) {
    left = left * T(right)
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter right: The right operand
public func /=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat3<T>, right: S) {
    left = left / right
}


/// Compares to matrices
public func ==<T: ArithmeticScalarType> (left: tmat3<T>, right: tmat3<T>) -> Bool {
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
public func transpose<T: ArithmeticScalarType> (_ mat: tmat3<T>) -> tmat3<T> {
    return tmat3<T>(
        mat.array[0], mat.array[3], mat.array[6],
        mat.array[1], mat.array[4], mat.array[7],
        mat.array[2], mat.array[5], mat.array[8]
    )
}


/// Inverts a 3x3 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverse matrix
public func invert<T: ArithmeticScalarType> (_ mat: tmat3<T>) throws -> tmat3<T> {
    let det : T = mat.det
    
    guard det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let d : T = 1 / det
    
    var a : T = mat.array[4] * mat.array[8]
    var b : T = mat.array[7] * mat.array[5]
    let a11 : T = (a - b) * d
    
    a = mat.array[7] * mat.array[2]
    b = mat.array[1] * mat.array[8]
    let a21 : T = (a - b) * d
    
    a = mat.array[1] * mat.array[5]
    b = mat.array[4] * mat.array[2]
    let a31 : T = (a - b) * d
    
    a = mat.array[6] * mat.array[5]
    b = mat.array[3] * mat.array[8]
    let a12 : T = (a - b) * d
    
    a = mat.array[0] * mat.array[8]
    b = mat.array[6] * mat.array[2]
    let a22 : T = (a - b) * d
    
    
    a = mat.array[3] * mat.array[2]
    b = mat.array[0] * mat.array[5]
    let a32 : T = (a - b) * d
    
    a = mat.array[3] * mat.array[7]
    b = mat.array[6] * mat.array[4]
    let a13 : T = (a - b) * d
    
    a = mat.array[6] * mat.array[1]
    b = mat.array[0] * mat.array[7]
    let a23 : T = (a - b) * d
    
    
    a = mat.array[0] * mat.array[4]
    b = mat.array[3] * mat.array[1]
    let a33 : T = (a - b) * d

    return tmat3<T>(a11, a21, a31, a12, a22, a32, a13, a23, a33)
}


/// Inverts a 3x3 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverse matrix
public func invert (_ mat: mat3i) throws -> mat3f {
    let det : Int = mat.det
    
    guard det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let d : Float = 1.0 / Float(det)
    
    var a : Float = Float(mat.array[4] * mat.array[8])
    var b : Float = Float(mat.array[7] * mat.array[5])
    let a11 : Float = (a - b) * d
    
    a = Float(mat.array[7] * mat.array[2])
    b = Float(mat.array[1] * mat.array[8])
    let a21 : Float = (a - b) * d
    
    a = Float(mat.array[1] * mat.array[5])
    b = Float(mat.array[4] * mat.array[2])
    let a31 : Float = (a - b) * d
    
    a = Float(mat.array[6] * mat.array[5])
    b = Float(mat.array[3] * mat.array[8])
    let a12 : Float = (a - b) * d
    
    a = Float(mat.array[0] * mat.array[8])
    b = Float(mat.array[6] * mat.array[2])
    let a22 : Float = (a - b) * d
    
    
    a = Float(mat.array[3] * mat.array[2])
    b = Float(mat.array[0] * mat.array[5])
    let a32 : Float = (a - b) * d
    
    a = Float(mat.array[3] * mat.array[7])
    b = Float(mat.array[6] * mat.array[4])
    let a13 : Float = (a - b) * d
    
    a = Float(mat.array[6] * mat.array[1])
    b = Float(mat.array[0] * mat.array[7])
    let a23 : Float = (a - b) * d
    
    
    a = Float(mat.array[0] * mat.array[4])
    b = Float(mat.array[3] * mat.array[1])
    let a33 : Float = (a - b) * d
    
    return tmat3<Float>(a11, a21, a31, a12, a22, a32, a13, a23, a33)
}
