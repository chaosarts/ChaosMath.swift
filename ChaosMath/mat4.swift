//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat4<T: ArithmeticScalarType> : MatrixType {

    public typealias ElementType = T
    public typealias SelfType = tmat4<ElementType>
    public typealias VectorType = tvec4<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the row size of this matrix struct
    public static var rowCount : Int {get {return 4}}
    
    /// Provides the row size of this matrix struct
    public static var colCount : Int {get {return 4}}
    
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
        return determinant(row(0)!, row(1)!, row(2)!, row(3)!)
    }
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        return [row(0)!, row(1)!, row(2)!, row(3)!]
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
        return [col(0)!, col(1)!, col(2)!, col(3)!]
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
    public init<ForeignType: ArithmeticScalarType> (_ a11: ForeignType, _ a21: ForeignType, _ a31: ForeignType, _ a41: ForeignType,
        _ a12: ForeignType, _ a22: ForeignType, _ a32: ForeignType, _ a42: ForeignType,
        _ a13: ForeignType, _ a23: ForeignType, _ a33: ForeignType, _ a43: ForeignType,
        _ a14: ForeignType, _ a24: ForeignType, _ a34: ForeignType, _ a44: ForeignType) {
        array = [
            ElementType(a11), ElementType(a21), ElementType(a31), ElementType(a41),
            ElementType(a12), ElementType(a22), ElementType(a32), ElementType(a42),
            ElementType(a13), ElementType(a23), ElementType(a33), ElementType(a43),
            ElementType(a14), ElementType(a24), ElementType(a34), ElementType(a44)
        ]
    }
    
    
    /// Initializes the a diagonal matrix
    /// - parameter value: The value of the components with index i = j
    public init<ForeignType: ArithmeticScalarType> (_ value: ForeignType = 0) {
        let val : ElementType = ElementType(value)
        array[0] = val
        array[5] = val
        array[10] = val
        array[15] = val
    }
    
    
    /// Initializes the a diagonal matrix
    /// - parameter value: The value of the components with index i = j
    public init<ForeignType: ArithmeticScalarType> (_ mat: tmat4<ForeignType>) {
        array[0] = ElementType(mat.array[0])
        array[1] = ElementType(mat.array[1])
        array[2] = ElementType(mat.array[2])
        array[3] = ElementType(mat.array[3])
        array[4] = ElementType(mat.array[4])
        array[5] = ElementType(mat.array[5])
        array[6] = ElementType(mat.array[6])
        array[7] = ElementType(mat.array[7])
        array[8] = ElementType(mat.array[8])
        array[0] = ElementType(mat.array[9])
        array[10] = ElementType(mat.array[10])
        array[11] = ElementType(mat.array[11])
        array[12] = ElementType(mat.array[12])
        array[13] = ElementType(mat.array[13])
        array[14] = ElementType(mat.array[14])
        array[15] = ElementType(mat.array[15])
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
        if (array.count > 9) {self.array[9] = ElementType(array[9])}
        if (array.count > 10) {self.array[10] = ElementType(array[10])}
        if (array.count > 11) {self.array[11] = ElementType(array[11])}
        if (array.count > 12) {self.array[12] = ElementType(array[12])}
        if (array.count > 13) {self.array[13] = ElementType(array[13])}
        if (array.count > 14) {self.array[14] = ElementType(array[14])}
        if (array.count > 15) {self.array[15] = ElementType(array[15])}
    }
    
    
    /// Initializes the matrix with two column vectors
    /// - parameter a1: The first column
    /// - parameter a2: The second column
    public init<ForeignType: ArithmeticScalarType> (_ a1: tvec4<ForeignType>, _ a2: tvec4<ForeignType>, _ a3: tvec4<ForeignType>, _ a4: tvec4<ForeignType>) {
        array[0] = ElementType(a1.x)
        array[1] = ElementType(a1.y)
        array[2] = ElementType(a1.z)
        array[3] = ElementType(a1.w)

        array[4] = ElementType(a2.x)
        array[5] = ElementType(a2.y)
        array[6] = ElementType(a2.z)
        array[7] = ElementType(a2.w)

        array[8] = ElementType(a3.x)
        array[9] = ElementType(a3.y)
        array[10] = ElementType(a3.z)
        array[11] = ElementType(a3.w)

        array[12] = ElementType(a4.x)
        array[13] = ElementType(a4.y)
        array[14] = ElementType(a4.z)
        array[15] = ElementType(a4.w)
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init(arrayLiteral elements: ElementType...) {
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
            let colCount : Int = SelfType.colCount
            let x : ElementType = array[i]
            let y : ElementType = array[i + colCount]
            let z : ElementType = array[i + colCount + colCount]
            let w : ElementType = array[i + colCount + colCount + colCount]
            return VectorType(x, y, z, w)
        }
        return nil
    }
    
    
    /// Returns the components of the i-th col as vector
    /// - parameter i: Index of the column to return
    /// - returns: The column vector at index i
    public func col (_ i: Int) -> VectorType? {
        if i >= 0 && i < SelfType.rowCount  {
            let baseIndex : Int = i * SelfType.rowCount
            let x : ElementType = array[baseIndex]
            let y : ElementType = array[baseIndex + 1]
            let z : ElementType = array[baseIndex + 2]
            let w : ElementType = array[baseIndex + 3]
            return VectorType(x, y, z, w)
        }
        
        return nil
    }

    
    /// Returns the 2x2 submatrix by leaving out the i-th row and j-th column
    /// - parameter i: Index of the i the row
    /// - parameter j: Index of the j the row
    /// - returns: The submatrix
    public func submatrix (_ i: Int, j: Int) -> tmat3<ElementType>? {

        let a11 : ElementType = array[0]
        let a21 : ElementType = array[1]
        let a31 : ElementType = array[2]
        let a41 : ElementType = array[3]
        let a12 : ElementType = array[4]
        let a22 : ElementType = array[5]
        let a32 : ElementType = array[6]
        let a42 : ElementType = array[7]
        let a13 : ElementType = array[8]
        let a23 : ElementType = array[9]
        let a33 : ElementType = array[10]
        let a43 : ElementType = array[11]
        let a14 : ElementType = array[12]
        let a24 : ElementType = array[13]
        let a34 : ElementType = array[14]
        let a44 : ElementType = array[15]
        
        var a : ElementType = 0, b : ElementType = 0, c : ElementType = 0
        var d : ElementType = 0, e : ElementType = 0, f : ElementType = 0
        var g : ElementType = 0, h : ElementType = 0, i : ElementType = 0

        switch (i, j) {
            case (0, 0): 
                a = a22; b = a32; c = a42 
                d = a23; e = a33; f = a43
                g = a24; h = a34; i = a44
            case (1, 0): 
                a = a12; b = a32; c = a42 
                d = a13; e = a33; f = a43
                g = a14; h = a34; i = a44
            case (2, 0): 
                a = a12; b = a22; c = a42 
                d = a13; e = a23; f = a43
                g = a14; h = a24; i = a44
            case (3, 0): 
                a = a12; b = a22; c = a32 
                d = a13; e = a23; f = a33
                g = a14; h = a24; i = a34
            
            case (0, 1): 
                a = a21; b = a31; c = a41 
                d = a23; e = a33; f = a43
                g = a24; h = a34; i = a44
            case (1, 1): 
                a = a11; b = a31; c = a41 
                d = a13; e = a33; f = a43
                g = a14; h = a34; i = a44
            case (2, 1): 
                a = a11; b = a21; c = a41 
                d = a13; e = a23; f = a43
                g = a14; h = a24; i = a44
            case (3, 1): 
                a = a11; b = a21; c = a31 
                d = a13; e = a23; f = a33
                g = a14; h = a24; i = a34

            case (0, 2): 
                a = a21; b = a31; c = a41 
                d = a22; e = a32; f = a42
                g = a24; h = a34; i = a44
            case (1, 2): 
                a = a11; b = a31; c = a41 
                d = a12; e = a32; f = a42
                g = a14; h = a34; i = a44
            case (2, 2): 
                a = a11; b = a21; c = a41 
                d = a12; e = a22; f = a42
                g = a14; h = a24; i = a44
            case (3, 2): 
                a = a11; b = a21; c = a31 
                d = a12; e = a22; f = a32
                g = a14; h = a24; i = a34

            case (0, 3): 
                a = a21; b = a31; c = a41 
                d = a22; e = a32; f = a42
                g = a23; h = a33; i = a43
            case (1, 3): 
                a = a11; b = a31; c = a41 
                d = a12; e = a32; f = a42
                g = a13; h = a33; i = a43
            case (2, 3): 
                a = a11; b = a21; c = a41 
                d = a12; e = a22; f = a42
                g = a13; h = a23; i = a43
            case (3, 3): 
                a = a11; b = a21; c = a31
                d = a12; e = a22; f = a32
                g = a13; h = a23; i = a33
            
            default: return nil
        }

        return tmat3<ElementType>(a, b, c, d, e, f, g, h, i)
    }
}


public typealias mat4i = tmat4<Int>
public typealias mat4f = tmat4<Float>
public typealias mat4d = tmat4<Double>
public typealias mat4 = mat4f


/*
 +--------------------------------------------------------------------------
 | Operators
 +--------------------------------------------------------------------------
 */

/// Negates the given matrix
/// - parameter mat: The matrix to negate
/// - returns: The negated matrix
public prefix func -<T: ArithmeticScalarType> (mat: tmat4<T>) -> tmat4<T> {
    
    let a11 : T = -mat.array[0]
    let a21 : T = -mat.array[1]
    let a31 : T = -mat.array[2]
    let a41 : T = -mat.array[3]
    let a12 : T = -mat.array[4]
    let a22 : T = -mat.array[5]
    let a32 : T = -mat.array[6]
    let a42 : T = -mat.array[7]
    let a13 : T = -mat.array[8]
    let a23 : T = -mat.array[9]
    let a33 : T = -mat.array[10]
    let a43 : T = -mat.array[11]
    let a14 : T = -mat.array[12]
    let a24 : T = -mat.array[13]
    let a34 : T = -mat.array[14]
    let a44 : T = -mat.array[15]
    
    return tmat4<T>(
        a11, a21, a31, a41,
        a12, a22, a32, a42,
        a13, a23, a33, a43,
        a14, a24, a34, a44
    )
}


/// Calculates the component wise sum of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The sum of the matrices
public func +<T: ArithmeticScalarType> (left: tmat4<T>, right: tmat4<T>) -> tmat4<T> {
    let a11 : T = left.array[0] + right.array[0]
    let a21 : T = left.array[1] + right.array[1]
    let a31 : T = left.array[2] + right.array[2]
    let a41 : T = left.array[3] + right.array[3]
    let a12 : T = left.array[4] + right.array[4]
    let a22 : T = left.array[5] + right.array[5]
    let a32 : T = left.array[6] + right.array[6]
    let a42 : T = left.array[7] + right.array[7]
    let a13 : T = left.array[8] + right.array[8]
    let a23 : T = left.array[9] + right.array[9]
    let a33 : T = left.array[10] + right.array[10]
    let a43 : T = left.array[11] + right.array[11]
    let a14 : T = left.array[12] + right.array[12]
    let a24 : T = left.array[13] + right.array[13]
    let a34 : T = left.array[14] + right.array[14]
    let a44 : T = left.array[15] + right.array[15]

    return tmat4<T>(
        a11, a21, a31, a41,
        a12, a22, a32, a42,
        a13, a23, a33, a43,
        a14, a24, a34, a44
    )
}


/// Calcuates the component wise difference between two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The difference of the matrices
public func -<T: ArithmeticScalarType> (left: tmat4<T>, right: tmat4<T>) -> tmat4<T> {
    return left - right
}


/// Calculates the product of two matrices
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrices
public func *<T: ArithmeticScalarType> (left: tmat4<T>, right: tmat4<T>) -> tmat4<T> {
    let a11 : T = left.array[0]
    let a21 : T = left.array[1]
    let a31 : T = left.array[2]
    let a41 : T = left.array[3]
    let a12 : T = left.array[4]
    let a22 : T = left.array[5]
    let a32 : T = left.array[6]
    let a42 : T = left.array[7]
    let a13 : T = left.array[8]
    let a23 : T = left.array[9]
    let a33 : T = left.array[10]
    let a43 : T = left.array[11]
    let a14 : T = left.array[12]
    let a24 : T = left.array[13]
    let a34 : T = left.array[14]
    let a44 : T = left.array[15]

    let b11 : T = right.array[0]
    let b21 : T = right.array[1]
    let b31 : T = right.array[2]
    let b41 : T = right.array[3]
    let b12 : T = right.array[4]
    let b22 : T = right.array[5]
    let b32 : T = right.array[6]
    let b42 : T = right.array[7]
    let b13 : T = right.array[8]
    let b23 : T = right.array[9]
    let b33 : T = right.array[10]
    let b43 : T = right.array[11]
    let b14 : T = right.array[12]
    let b24 : T = right.array[13]
    let b34 : T = right.array[14]
    let b44 : T = right.array[15]

    var a : T = a11 * b11; var b : T = a12 * b12; var c : T = a13 * b13; var d : T = a14 * b14
    let c11 = a + b + c + d

    a = a11 * b21; b = a12 * b22; c = a13 * b23; d = a14 * b24
    let c12 = a + b + c + d

    a = a11 * b31; b = a12 * b32; c = a13 * b33; d = a14 * b34
    let c13 = a + b + c + d

    a = a11 * b41; b = a12 * b42; c = a13 * b43; d = a14 * b44
    let c14 = a + b + c + d

    a = a21 * b11; b = a22 * b12; c = a23 * b13; d = a24 * b14
    let c21 = a + b + c + d

    a = a21 * b21; b = a22 * b22; c = a23 * b23; d = a24 * b24
    let c22 = a + b + c + d

    a = a21 * b31; b = a22 * b32; c = a23 * b33; d = a24 * b34
    let c23 = a + b + c + d

    a = a21 * b41; b = a22 * b42; c = a23 * b43; d = a24 * b44
    let c24 = a + b + c + d

    a = a31 * b11; b = a32 * b12; c = a33 * b13; d = a34 * b14
    let c31 = a + b + c + d

    a = a31 * b21; b = a32 * b22; c = a33 * b23; d = a34 * b24
    let c32 = a + b + c + d

    a = a31 * b31; b = a32 * b32; c = a33 * b33; d = a34 * b34
    let c33 = a + b + c + d

    a = a31 * b41; b = a32 * b42; c = a33 * b43; d = a34 * b44
    let c34 = a + b + c + d

    a = a41 * b11; b = a42 * b12; c = a43 * b13; d = a44 * b14
    let c41 = a + b + c + d

    a = a41 * b21; b = a42 * b22; c = a43 * b23; d = a44 * b24
    let c42 = a + b + c + d

    a = a41 * b31; b = a42 * b32; c = a43 * b33; d = a44 * b34
    let c43 = a + b + c + d

    a = a41 * b41; b = a42 * b42; c = a43 * b43; d = a44 * b44
    let c44 = a + b + c + d


    return tmat4<T>(c11, c21, c31, c41, c12, c22, c32, c42, c13, c23, c33, c43, c14, c24, c34, c44)
}


/// Calculates the right side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (vec: tvec4<T>, mat: tmat4<T>) -> tvec4<T> {
    var x: T = 0, y: T = 0, z: T = 0, w: T = 0
    
    x += vec.x * mat.array[0]
    x += vec.y * mat.array[1]
    x += vec.z * mat.array[2]
    x += vec.w * mat.array[3]
    
    y += vec.x * mat.array[4]
    y += vec.y * mat.array[5]
    y += vec.z * mat.array[6]
    y += vec.w * mat.array[7]
    
    z += vec.x * mat.array[8]
    z += vec.y * mat.array[9]
    z += vec.z * mat.array[10]
    z += vec.w * mat.array[11]
    
    w += vec.x * mat.array[12]
    w += vec.y * mat.array[13]
    w += vec.z * mat.array[14]
    w += vec.w * mat.array[15]
    
    return tvec4<T>(x, y, z, w)
}


/// Calculates the left side multiplication
/// - parameter mat:
/// - parameter vec:
/// - returns: The resulting vector of the multiplication
public func *<T: ArithmeticScalarType> (mat: tmat4<T>, vec: tvec4<T>) -> tvec4<T> {
    var x: T = 0, y: T = 0, z: T = 0, w: T = 0
    
    x += vec.x * mat.array[0]
    x += vec.y * mat.array[4]
    x += vec.z * mat.array[8]
    x += vec.w * mat.array[12]
    
    y += vec.x * mat.array[1]
    y += vec.y * mat.array[5]
    y += vec.z * mat.array[9]
    y += vec.w * mat.array[13]
    
    z += vec.x * mat.array[2]
    z += vec.y * mat.array[6]
    z += vec.z * mat.array[10]
    z += vec.w * mat.array[14]
    
    w += vec.x * mat.array[3]
    w += vec.y * mat.array[7]
    w += vec.z * mat.array[11]
    w += vec.w * mat.array[15]
    
    return tvec4<T>(x, y, z, w)
}



/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<S: ArithmeticScalarType, T: ArithmeticScalarType> (left: S, right: tmat4<T>) -> tmat4<T> {
    let scalar : T = T(left)
    let a11 : T = scalar * right.array[0]
    let a21 : T = scalar * right.array[1]
    let a31 : T = scalar * right.array[2]
    let a41 : T = scalar * right.array[3]
    
    let a12 : T = scalar * right.array[4]
    let a22 : T = scalar * right.array[5]
    let a32 : T = scalar * right.array[6]
    let a42 : T = scalar * right.array[7]
    
    let a13 : T = scalar * right.array[8]
    let a23 : T = scalar * right.array[9]
    let a33 : T = scalar * right.array[10]
    let a43 : T = scalar * right.array[11]
    
    let a14 : T = scalar * right.array[12]
    let a24 : T = scalar * right.array[13]
    let a34 : T = scalar * right.array[14]
    let a44 : T = scalar * right.array[15]
    
    return tmat4<T>(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}


/// Calculates the product of a scalar and a matrix
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func *<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tmat4<T>, right: S) -> tmat4<T> {
    let scalar : T = T(right)
    let a11 : T = left.array[0] * scalar
    let a21 : T = left.array[1] * scalar
    let a31 : T = left.array[2] * scalar
    let a41 : T = left.array[3] * scalar
    
    let a12 : T = left.array[4] * scalar
    let a22 : T = left.array[5] * scalar
    let a32 : T = left.array[6] * scalar
    let a42 : T = left.array[7] * scalar
    
    let a13 : T = left.array[8] * scalar
    let a23 : T = left.array[9] * scalar
    let a33 : T = left.array[10] * scalar
    let a43 : T = left.array[11] * scalar
    
    let a14 : T = left.array[12] * scalar
    let a24 : T = left.array[13] * scalar
    let a34 : T = left.array[14] * scalar
    let a44 : T = left.array[15] * scalar
    
    return tmat4<T>(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}


/// Devides the matrix by the given scalar
/// - parameter left: The left operand
/// - parameter right: The right operand
/// - returns: The product of the matrix and scalar
public func /<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: tmat4<T>, right: S) -> tmat4<T> {
    let scalar : T = T(right)
    let a11 : T = left.array[0] / scalar 
    let a21 : T = left.array[1] / scalar 
    let a31 : T = left.array[2] / scalar 
    let a41 : T = left.array[3] / scalar

    let a12 : T = left.array[4] / scalar 
    let a22 : T = left.array[5] / scalar 
    let a32 : T = left.array[6] / scalar 
    let a42 : T = left.array[7] / scalar

    let a13 : T = left.array[8] / scalar 
    let a23 : T = left.array[9] / scalar 
    let a33 : T = left.array[10] / scalar 
    let a43 : T = left.array[11] / scalar

    let a14 : T = left.array[12] / scalar 
    let a24 : T = left.array[13] / scalar 
    let a34 : T = left.array[14] / scalar 
    let a44 : T = left.array[15] / scalar

    return tmat4<T>(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}


/// Compound sum operator
/// - parameter left: The left side operand and target object to assign the result to
/// - parameter right: The right operand to add to the left side
public func +=<T: ArithmeticScalarType> (left: inout tmat4<T>, right: tmat4<T>) {
    left = left + right
}



/// Compound sub operator
/// - parameter left: The left side operand and target object to assign the result to
/// - parameter right: The right operand to add to the left side
public func -=<T: ArithmeticScalarType> (left: inout tmat4<T>, right: tmat4<T>) {
    left = left - right
}



/// Compound multiplication operator
/// - parameter left: The left side operand and target object to assign the result to
/// - parameter right: The right operand to multiply to the left side
public func *=<T: ArithmeticScalarType> (left: inout tmat4<T>, right: tmat4<T>) {
    left = left * right
}


/// Compound multiplication operator with a scalar
/// - parameter left: The left side operand and target object to assign the result to
/// - parameter right: The right operand to add to the left side
public func *=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat4<T>, right: S) {
    left = left * right
}


/// Compund operator for addition
/// - parameter left: The left operand
/// - parameter rught: The right operand
public func /=<T: ArithmeticScalarType, S: ArithmeticScalarType> (left: inout tmat4<T>, right: S) {
    left = left / right
}


/// Compares to matrices
public func ==<T: ArithmeticScalarType> (left: tmat4<T>, right: tmat4<T>) -> Bool {
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
public func transpose<T: ArithmeticScalarType> (_ mat: tmat4<T>) -> tmat4<T> {
    return tmat4<T>(
        mat.array[0], mat.array[4], mat.array[8], mat.array[12],
        mat.array[1], mat.array[5], mat.array[9], mat.array[13],
        mat.array[2], mat.array[6], mat.array[10], mat.array[14],
        mat.array[3], mat.array[7], mat.array[11], mat.array[15]
    )
}


/// Inverts a 4x4 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert (_ mat: mat4f) throws -> mat4f {

    let m11 : Float = mat.array[0]
    let m21 : Float = mat.array[1]
    let m31 : Float = mat.array[2]
    let m41 : Float = mat.array[3]
    let m12 : Float = mat.array[4]
    let m22 : Float = mat.array[5]
    let m32 : Float = mat.array[6]
    let m42 : Float = mat.array[7]
    let m13 : Float = mat.array[8]
    let m23 : Float = mat.array[9]
    let m33 : Float = mat.array[10]
    let m43 : Float = mat.array[11]
    let m14 : Float = mat.array[12]
    let m24 : Float = mat.array[13]
    let m34 : Float = mat.array[14]
    let m44 : Float = mat.array[15]

    let a0 : Float = m11 * m22 - m21 * m12
    let a1 : Float = m11 * m32 - m31 * m12
    let a2 : Float = m11 * m42 - m41 * m12
    let a3 : Float = m21 * m32 - m31 * m22
    let a4 : Float = m21 * m42 - m41 * m22
    let a5 : Float = m31 * m42 - m41 * m32

    let b0 : Float = m13 * m24 - m23 * m14
    let b1 : Float = m13 * m34 - m33 * m14
    let b2 : Float = m13 * m44 - m43 * m14
    let b3 : Float = m23 * m34 - m33 * m24
    let b4 : Float = m23 * m44 - m43 * m24
    let b5 : Float = m33 * m44 - m43 * m34


    var tmpDet : Float = a0 * b5 - a1 * b4 + a2 * b3
    tmpDet += a3 * b2 - a4 * b1 + a5 * b0
    
    guard tmpDet != 0 else {
        throw MatrixError.NonRegular
    }


    let inverseDet : Float = 1 / tmpDet

    var a : Float = m22 * b5
    var b : Float = -m32 * b4
    var c : Float = m42 * b3
    let a11 : Float = (a + b + c) * inverseDet;

    a = -m21 * b5
    b = m31 * b4
    c = -m41 * b3
    let a21 : Float = (a + b + c) * inverseDet;

    a = m24 * a5
    b = -m34 * a4
    c = m44 * a3
    let a31 : Float = (a + b + c) * inverseDet;

    a = -m23 * a5
    b = m33 * a4
    c = -m43 * a3
    let a41 : Float = (a + b + c) * inverseDet;

    a = -m12 * b5
    b = m32 * b2
    c = -m42 * b1
    let a12 : Float = (a + b + c) * inverseDet;

    a = m11 * b5
    b = -m31 * b2
    c = m41 * b1
    let a22 : Float = (a + b + c) * inverseDet;

    a = -m14 * a5
    b = m34 * a2
    c = -m44 * a1
    let a32 : Float = (a + b + c) * inverseDet;

    a = m13 * a5
    b = -m33 * a2
    c = m43 * a1
    let a42 : Float = (a + b + c) * inverseDet;

    a = m12 * b4
    b = -m22 * b2
    c = m42 * b0
    let a13 : Float = (a + b + c) * inverseDet;

    a = -m11 * b4
    b = m21 * b2
    c = -m41 * b0
    let a23 : Float = (a + b + c) * inverseDet;

    a = m14 * a4
    b = -m24 * a2
    c = m44 * a0
    let a33 : Float = (a + b + c) * inverseDet;

    a = -m13 * a4
    b = m23 * a2
    c = -m43 * a0
    let a43 : Float = (a + b + c) * inverseDet;

    a = -m12 * b3
    b = m22 * b1
    c = -m32 * b0
    let a14 : Float = (a + b + c) * inverseDet;

    a = m11 * b3
    b = -m21 * b1
    c = m31 * b0
    let a24 : Float = (a + b + c) * inverseDet;

    a = -m14 * a3
    b = m24 * a1
    c = -m34 * a0
    let a34 : Float = (a + b + c) * inverseDet;

    a = m13 * a3
    b = -m23 * a1
    c = m33 * a0
    let a44 : Float = (a + b + c) * inverseDet;

    
    return mat4f(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}


/// Inverts a 4x4 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert (_ mat: mat4d) throws -> mat4d {

    let m11 : Double = mat.array[0]
    let m21 : Double = mat.array[1]
    let m31 : Double = mat.array[2]
    let m41 : Double = mat.array[3]
    let m12 : Double = mat.array[4]
    let m22 : Double = mat.array[5]
    let m32 : Double = mat.array[6]
    let m42 : Double = mat.array[7]
    let m13 : Double = mat.array[8]
    let m23 : Double = mat.array[9]
    let m33 : Double = mat.array[10]
    let m43 : Double = mat.array[11]
    let m14 : Double = mat.array[12]
    let m24 : Double = mat.array[13]
    let m34 : Double = mat.array[14]
    let m44 : Double = mat.array[15]

    let a0 : Double = m11 * m22 - m21 * m12
    let a1 : Double = m11 * m32 - m31 * m12
    let a2 : Double = m11 * m42 - m41 * m12
    let a3 : Double = m21 * m32 - m31 * m22
    let a4 : Double = m21 * m42 - m41 * m22
    let a5 : Double = m31 * m42 - m41 * m32

    let b0 : Double = m13 * m24 - m23 * m14
    let b1 : Double = m13 * m34 - m33 * m14
    let b2 : Double = m13 * m44 - m43 * m14
    let b3 : Double = m23 * m34 - m33 * m24
    let b4 : Double = m23 * m44 - m43 * m24
	let b5 : Double = m33 * m44 - m43 * m34


    var tmpDet : Double = a0 * b5 - a1 * b4 + a2 * b3
    tmpDet += a3 * b2 - a4 * b1 + a5 * b0
    
    guard tmpDet != 0 else {
        throw MatrixError.NonRegular
    }


    let inverseDet : Double = 1 / tmpDet

    var a : Double = m22 * b5
    var b : Double = -m32 * b4
    var c : Double = m42 * b3
    let a11 : Double = (a + b + c) * inverseDet;

    a = -m21 * b5
    b = m31 * b4
    c = -m41 * b3
    let a21 : Double = (a + b + c) * inverseDet;

    a = m24 * a5
    b = -m34 * a4
    c = m44 * a3
    let a31 : Double = (a + b + c) * inverseDet;

    a = -m23 * a5
    b = m33 * a4
    c = -m43 * a3
    let a41 : Double = (a + b + c) * inverseDet;

    a = -m12 * b5
    b = m32 * b2
    c = -m42 * b1
    let a12 : Double = (a + b + c) * inverseDet;

    a = m11 * b5
    b = -m31 * b2
    c = m41 * b1
    let a22 : Double = (a + b + c) * inverseDet;

    a = -m14 * a5
    b = m34 * a2
    c = -m44 * a1
    let a32 : Double = (a + b + c) * inverseDet;

    a = m13 * a5
    b = -m33 * a2
    c = m43 * a1
    let a42 : Double = (a + b + c) * inverseDet;

    a = m12 * b4
    b = -m22 * b2
    c = m42 * b0
    let a13 : Double = (a + b + c) * inverseDet;

    a = -m11 * b4
    b = m21 * b2
    c = -m41 * b0
    let a23 : Double = (a + b + c) * inverseDet;

    a = m14 * a4
    b = -m24 * a2
    c = m44 * a0
    let a33 : Double = (a + b + c) * inverseDet;

    a = -m13 * a4
    b = m23 * a2
    c = -m43 * a0
    let a43 : Double = (a + b + c) * inverseDet;

    a = -m12 * b3
    b = m22 * b1
    c = -m32 * b0
    let a14 : Double = (a + b + c) * inverseDet;

    a = m11 * b3
    b = -m21 * b1
    c = m31 * b0
    let a24 : Double = (a + b + c) * inverseDet;

    a = -m14 * a3
    b = m24 * a1
    c = -m34 * a0
    let a34 : Double = (a + b + c) * inverseDet;

    a = m13 * a3
    b = -m23 * a1
    c = m33 * a0
    let a44 : Double = (a + b + c) * inverseDet;

    
    return mat4d(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}


/// Inverts a 4x4 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverted matrix
public func invert<T: ArithmeticIntType> (_ mat: tmat4<T>) throws -> mat4f {

    let m11 : Float = Float(mat.array[0])
    let m21 : Float = Float(mat.array[1])
    let m31 : Float = Float(mat.array[2])
    let m41 : Float = Float(mat.array[3])
    let m12 : Float = Float(mat.array[4])
    let m22 : Float = Float(mat.array[5])
    let m32 : Float = Float(mat.array[6])
    let m42 : Float = Float(mat.array[7])
    let m13 : Float = Float(mat.array[8])
    let m23 : Float = Float(mat.array[9])
    let m33 : Float = Float(mat.array[10])
    let m43 : Float = Float(mat.array[11])
    let m14 : Float = Float(mat.array[12])
    let m24 : Float = Float(mat.array[13])
    let m34 : Float = Float(mat.array[14])
    let m44 : Float = Float(mat.array[15])

    var a0 : Float = m11 * m22
    a0 -= m21 * m12

    var a1 : Float = m11 * m32
    a1 -= m31 * m12

    var a2 : Float = m11 * m42
    a2 -= m41 * m12

    var a3 : Float = m21 * m32
    a3 -= m31 * m22

    var a4 : Float = m21 * m42
    a4 -= m41 * m22

    var a5 : Float = m31 * m42
    a5 -= m41 * m32

    var b0 : Float = m13 * m24
    b0 -= m23 * m14

    var b1 : Float = m13 * m34
    b1 -= m33 * m14

    var b2 : Float = m13 * m44
    b2 -= m43 * m14

    var b3 : Float = m23 * m34
    b3 -= m33 * m24

    var b4 : Float = m23 * m44
    b4 -= m43 * m24

    var b5 : Float = m33 * m44
    b5 -= m43 * m34


    var tmpDet : Float = a0 * b5 
    tmpDet -= a1 * b4 
    tmpDet += a2 * b3
    tmpDet += a3 * b2
    tmpDet -= a4 * b1 
    tmpDet += a5 * b0
    
    guard tmpDet != 0 else {
        throw MatrixError.NonRegular
    }

    let inverseDet : Float = 1 / tmpDet

    var a11 : Float = m22 * b5
    a11 -= m32 * b4 
    a11 += m42 * b3
    a11 *= inverseDet

    var a21 : Float = -m21 * b5
    a21 += m31 * b4 
    a21 -= m41 * b3
    a21 *= inverseDet

    var a31 : Float = m24 * a5
    a31 -= m34 * a4 
    a31 += m44 * a3
    a31 *= inverseDet

    var a41 : Float = -m23 * a5
    a41 += m33 * a4 
    a41 -= m43 * a3
    a41 *= inverseDet

    var a12 : Float = -m12 * b5
    a12 += m32 * b2 
    a12 -= m42 * b1
    a12 *= inverseDet

    var a22 : Float = m11 * b5
    a22 -= m31 * b2 
    a22 += m41 * b1
    a22 *= inverseDet

    var a32 : Float = -m14 * a5
    a32 += m34 * a2 
    a32 -= m44 * a1
    a32 *= inverseDet

    var a42 : Float = m13 * a5
    a42 -= m33 * a2 
    a42 += m43 * a1
    a42 *= inverseDet

    var a13 : Float = m12 * b4
    a13 -= m22 * b2 
    a13 += m42 * b0
    a13 *= inverseDet

    var a23 : Float = -m11 * b4
    a23 += m21 * b2 
    a23 -= m41 * b0
    a23 *= inverseDet

    var a33 : Float = m14 * a4
    a33 -= m24 * a2 
    a33 += m44 * a0
    a33 *= inverseDet

    var a43 : Float = -m13 * a4
    a43 += m23 * a2 
    a43 -= m43 * a0
    a43 *= inverseDet

    var a14 : Float = -m12 * b3
    a14 += m22 * b1 
    a14 -= m32 * b0
    a14 *= inverseDet

    var a24 : Float = m11 * b3
    a24 -= m21 * b1 
    a24 += m31 * b0
    a24 *= inverseDet

    var a34 : Float = -m14 * a3
    a34 += m24 * a1 
    a34 -= m34 * a0
    a34 *= inverseDet

    var a44 : Float = m13 * a3
    a44 -= m23 * a1 
    a44 += m33 * a0
    a44 *= inverseDet


    return mat4f(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
}
