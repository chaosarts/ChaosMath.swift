//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat4<T: ArithmeticType> : MatrixType {

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
    | Operators
    +--------------------------------------------------------------------------
    */
    
    /// Negates the given matrix
    /// - parameter mat: The matrix to negate
    /// - returns: The negated matrix
    public static prefix func - (mat: SelfType) -> SelfType {
        return SelfType(-mat.array[0], -mat.array[1], -mat.array[2], -mat.array[3], 
            -mat.array[4], -mat.array[5], -mat.array[6], -mat.array[7], 
            -mat.array[8], -mat.array[9], -mat.array[10], -mat.array[11],
            -mat.array[12], -mat.array[13], -mat.array[14], -mat.array[15]) 
    }
    
    
    /// Calculates the component wise sum of two matrices
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The sum of the matrices
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(
            left.array[0] + right.array[0],
            left.array[1] + right.array[1],
            left.array[2] + right.array[2],
            left.array[3] + right.array[3],
            left.array[4] + right.array[4],
            left.array[5] + right.array[5],
            left.array[6] + right.array[6],
            left.array[7] + right.array[7],
            left.array[8] + right.array[8],
            left.array[9] + right.array[9],
            left.array[10] + right.array[10],
            left.array[11] + right.array[11],
            left.array[12] + right.array[12],
            left.array[13] + right.array[13],
            left.array[14] + right.array[14],
            left.array[15] + right.array[15]
        )
    }
    
    
    /// Calcuates the component wise difference between two matrices
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The difference of the matrices
    public static func - (left: SelfType, right: SelfType) -> SelfType {
        return left - right
    }

    
    /// Calculates the product of two matrices
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The product of the matrices
    public static func * (left: SelfType, right: SelfType) -> SelfType {
        let a11 : ElementType = left.array[0] * right.array[0] + left.array[4] * right.array[1] + left.array[8] * right.array[2] + left.array[12] * right.array[3]
        let a21 : ElementType = left.array[1] * right.array[0] + left.array[5] * right.array[1] + left.array[9] * right.array[2] + left.array[13] * right.array[3]
        let a31 : ElementType = left.array[2] * right.array[0] + left.array[6] * right.array[1] + left.array[10] * right.array[2] + left.array[14] * right.array[3]
        let a41 : ElementType = left.array[3] * right.array[0] + left.array[7] * right.array[1] + left.array[11] * right.array[2] + left.array[15] * right.array[3]

        let a12 : ElementType = left.array[0] * right.array[4] + left.array[4] * right.array[5] + left.array[8] * right.array[6] + left.array[12] * right.array[7]
        let a22 : ElementType = left.array[1] * right.array[4] + left.array[5] * right.array[5] + left.array[9] * right.array[6] + left.array[13] * right.array[7]
        let a32 : ElementType = left.array[2] * right.array[4] + left.array[6] * right.array[5] + left.array[10] * right.array[6] + left.array[14] * right.array[7]
        let a42 : ElementType = left.array[3] * right.array[4] + left.array[7] * right.array[5] + left.array[11] * right.array[6] + left.array[15] * right.array[7]

        let a13 : ElementType = left.array[0] * right.array[8] + left.array[4] * right.array[9] + left.array[8] * right.array[10] + left.array[12] * right.array[11]
        let a23 : ElementType = left.array[1] * right.array[8] + left.array[5] * right.array[9] + left.array[9] * right.array[10] + left.array[13] * right.array[11]
        let a33 : ElementType = left.array[2] * right.array[8] + left.array[6] * right.array[9] + left.array[10] * right.array[10] + left.array[14] * right.array[11]
        let a43 : ElementType = left.array[3] * right.array[8] + left.array[7] * right.array[9] + left.array[11] * right.array[10] + left.array[15] * right.array[11]

        let a14 : ElementType = left.array[0] * right.array[12] + left.array[4] * right.array[13] + left.array[8] * right.array[14] + left.array[12] * right.array[15]
        let a24 : ElementType = left.array[1] * right.array[12] + left.array[5] * right.array[13] + left.array[9] * right.array[14] + left.array[13] * right.array[15]
        let a34 : ElementType = left.array[2] * right.array[12] + left.array[6] * right.array[13] + left.array[10] * right.array[14] + left.array[14] * right.array[15]
        let a44 : ElementType = left.array[3] * right.array[12] + left.array[7] * right.array[13] + left.array[11] * right.array[14] + left.array[15] * right.array[15]

        return SelfType(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
    }

    
    /// Calculates the right side multiplication
    /// - parameter mat:
    /// - parameter vec:
    /// - returns: The resulting vector of the multiplication
    public static func * (vec: VectorType, mat: SelfType) -> VectorType {
        var x: ElementType = 0, y: ElementType = 0, z: ElementType = 0, w: ElementType = 0
        
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
        
        return VectorType(x, y, z, w)
    }


    /// Calculates the left side multiplication
    /// - parameter mat:
    /// - parameter vec:
    /// - returns: The resulting vector of the multiplication
    public static func * (mat: SelfType, vec: VectorType) -> VectorType {
        var x: ElementType = 0, y: ElementType = 0, z: ElementType = 0, w: ElementType = 0
        
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

        return VectorType(x, y, z, w)
    }

    
    
    /// Calculates the product of a scalar and a matrix
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The product of the matrix and scalar
    public static func * (left: ElementType, right: SelfType) -> SelfType {
        let a11 : ElementType = left * right.array[0]
        let a21 : ElementType = left * right.array[1]
        let a31 : ElementType = left * right.array[2]
        let a41 : ElementType = left * right.array[3]

        let a12 : ElementType = left * right.array[4]
        let a22 : ElementType = left * right.array[5]
        let a32 : ElementType = left * right.array[6]
        let a42 : ElementType = left * right.array[7]

        let a13 : ElementType = left * right.array[8]
        let a23 : ElementType = left * right.array[9]
        let a33 : ElementType = left * right.array[10]
        let a43 : ElementType = left * right.array[11]

        let a14 : ElementType = left * right.array[12]
        let a24 : ElementType = left * right.array[13]
        let a34 : ElementType = left * right.array[14]
        let a44 : ElementType = left * right.array[15]

        return SelfType(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44)
    }
    
    
    /// Calculates the product of a scalar and a matrix
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The product of the matrix and scalar
    public static func * (left: SelfType, right: ElementType) -> SelfType {
        return right * left
    }
    
    
    /// Devides the matrix by the given scalar
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The product of the matrix and scalar
    public static func / (left: SelfType, right: ElementType) -> SelfType {
        return SelfType(
            left.array[0] / right, left.array[1] / right, left.array[2] / right, left.array[3] / right,
            left.array[4] / right, left.array[5] / right, left.array[6] / right, left.array[7] / right,
            left.array[8] / right, left.array[9] / right, left.array[10] / right, left.array[11] / right,
            left.array[12] / right, left.array[13] / right, left.array[14] / right, left.array[15] / right
        )
    }
    
    
    /// Compound sum operator
    /// - parameter left: The left side operand and target object to assign the result to
    /// - parameter right: The right operand to add to the left side
    public static func += (left: inout SelfType, right: SelfType) {
        left = left + right
    }

    
    
    /// Compound sub operator
    /// - parameter left: The left side operand and target object to assign the result to
    /// - parameter right: The right operand to add to the left side
    public static func -= (left: inout SelfType, right: SelfType) {
        left = left - right
    }

    
    
    /// Compound multiplication operator
    /// - parameter left: The left side operand and target object to assign the result to
    /// - parameter right: The right operand to multiply to the left side
    public static func *= (left: inout SelfType, right: SelfType) {
        left = left * right
    }
    
    
    /// Compound multiplication operator with a scalar
    /// - parameter left: The left side operand and target object to assign the result to
    /// - parameter right: The right operand to add to the left side
    public static func *= (left: inout SelfType, right: ElementType) {
        left = left * right
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter rught: The right operand
    public static func /= (left: inout SelfType, right: ElementType) {
        left = left / right
    }
    
    
    /// Compares to matrices
    public static func == (left: SelfType, right: SelfType) -> Bool {
        for i in 0..<left.array.count {
            if left.array[i] != right.array[i] {
                return false
            }
        }
        
        return true
    }
    
    
    /*
    +--------------------------------------------------------------------------
    | Stored properties
    +--------------------------------------------------------------------------
    */
    
    /// Provides the matrix as array as row-major
    public private(set) var array : Array<ElementType>
    
    
    /*
    +--------------------------------------------------------------------------
    | Derived properties
    +--------------------------------------------------------------------------
    */
    
    /// Provides the determinant of this matrix
    public var det : ElementType {
        get {
            do {return try determinant(row(0), row(1), row(2), row(3))}
            catch {return 0}
        }
    }
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        get {
            do {return try [row(0), row(1), row(2), row(3)]}
            catch {return []}
        }
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
        get {
            do {return try [col(0), col(1), col(2), col(3)]}
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
    public init (_ a11: ElementType, _ a21: ElementType, _ a31: ElementType, _ a41: ElementType,
        _ a12: ElementType, _ a22: ElementType, _ a32: ElementType, _ a42: ElementType,
        _ a13: ElementType, _ a23: ElementType, _ a33: ElementType, _ a43: ElementType,
        _ a14: ElementType, _ a24: ElementType, _ a34: ElementType, _ a44: ElementType) {
        array = [a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44]
    }
    
    
    /// Initializes the a diagonal matrix
    /// - parameter value: The value of the components with index i = j
    public init (_ value: ElementType) {
        array = [value, 0, 0, 0, 0, value, 0, 0, 0, 0, value, 0, 0, 0, 0, value]
    }
    
    
    /// Initializes the null matrix
    public init () {
        array = Array(repeating: 0, count: SelfType.rowCount * SelfType.colCount)
    }
    
    
    /// Initializes the matrix with an array
    /// - parameter array: The row-major array to copy
    public init (_ array: Array<ElementType>) {
        self.init()
        if (array.count > 0) {self.array[0] = array[0]}
        if (array.count > 1) {self.array[1] = array[1]}
        if (array.count > 2) {self.array[2] = array[2]}
        if (array.count > 3) {self.array[3] = array[3]}
        if (array.count > 4) {self.array[4] = array[4]}
        if (array.count > 5) {self.array[5] = array[5]}
        if (array.count > 6) {self.array[6] = array[6]}
        if (array.count > 7) {self.array[7] = array[7]}
        if (array.count > 8) {self.array[8] = array[8]}
        if (array.count > 9) {self.array[9] = array[9]}
        if (array.count > 10) {self.array[10] = array[10]}
        if (array.count > 11) {self.array[11] = array[11]}
        if (array.count > 12) {self.array[12] = array[12]}
        if (array.count > 13) {self.array[13] = array[13]}
        if (array.count > 14) {self.array[14] = array[14]}
        if (array.count > 15) {self.array[15] = array[15]}
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init(arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
    
    
    /// Initializes the matrix with two column vectors
    /// - parameter a1: The first column
    /// - parameter a2: The second column
    public init (_ a1: VectorType, _ a2: VectorType, _ a3: VectorType, _ a4: VectorType) {
        array = a1.array
        array.append(contentsOf: a2.array)
        array.append(contentsOf: a3.array)
        array.append(contentsOf: a4.array)
    }
    
    
    /// Returns the components of the i-th row as vector
    /// - parameter i: Index of the row to return
    /// - returns: The row vector at index i
    public func row (_ i: Int) throws -> VectorType {
        
        guard i >= 0 && i < SelfType.rowCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        return VectorType(array[i], array[i + SelfType.colCount], array[i + SelfType.colCount + SelfType.colCount], array[i + SelfType.colCount + SelfType.colCount + SelfType.colCount])
    }
    
    
    /// Returns the components of the i-th col as vector
    /// - parameter i: Index of the column to return
    /// - returns: The column vector at index i
    public func col (_ i: Int) throws -> VectorType {
        
        guard i >= 0 && i < SelfType.rowCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        let baseIndex : Int = i * SelfType.rowCount
        return VectorType(array[baseIndex], array[baseIndex + 1], array[baseIndex + 2], array[baseIndex + 3])
    }

    
    /// Returns the 2x2 submatrix by leaving out the i-th row and j-th column
    /// - parameter i: Index of the i the row
    /// - parameter j: Index of the j the row
    /// - returns: The submatrix
    public func submatrix (_ i: Int, j: Int) -> tmat3<T>? {
        switch (i, j) {
            case (0, 0): return tmat3<T>(array[5], array[6], array[7], array[9], array[10], array[11], array[13], array[14], array[15])
            case (1, 0): return tmat3<T>(array[4], array[6], array[7], array[8], array[10], array[11], array[12], array[14], array[15])
            case (2, 0): return tmat3<T>(array[4], array[5], array[7], array[8], array[9], array[11], array[12], array[13], array[15])
            case (3, 0): return tmat3<T>(array[4], array[5], array[6], array[8], array[9], array[10], array[12], array[13], array[14])
            
            case (0, 1): return tmat3<T>(array[1], array[2], array[3], array[9], array[10], array[11], array[13], array[14], array[15])
            case (1, 1): return tmat3<T>(array[0], array[2], array[3], array[8], array[10], array[11], array[12], array[14], array[15])
            case (2, 1): return tmat3<T>(array[0], array[1], array[3], array[8], array[9], array[11], array[12], array[13], array[15])
            case (3, 1): return tmat3<T>(array[0], array[1], array[2], array[8], array[9], array[10], array[12], array[13], array[14])

            case (0, 2): return tmat3<T>(array[1], array[2], array[3], array[5], array[6], array[7], array[13], array[14], array[15])
            case (1, 2): return tmat3<T>(array[0], array[2], array[3], array[4], array[6], array[7], array[12], array[14], array[15])
            case (2, 2): return tmat3<T>(array[0], array[1], array[3], array[4], array[5], array[7], array[12], array[13], array[15])
            case (3, 2): return tmat3<T>(array[0], array[1], array[2], array[4], array[5], array[6], array[12], array[13], array[14])

            case (0, 3): return tmat3<T>(array[1], array[2], array[3], array[5], array[6], array[7], array[9], array[10], array[11])
            case (1, 3): return tmat3<T>(array[0], array[2], array[3], array[4], array[6], array[7], array[8], array[10], array[11])
            case (2, 3): return tmat3<T>(array[0], array[1], array[3], array[4], array[5], array[7], array[8], array[9], array[11])
            case (3, 3): return tmat3<T>(array[0], array[1], array[2], array[4], array[5], array[6], array[8], array[9], array[10])
            
            default: return nil
        }
    }
}


public typealias mat4i = tmat4<Int>
public typealias mat4f = tmat4<Float>
public typealias mat4d = tmat4<Double>
public typealias mat4 = mat4f


/// Transposes the matrix
/// - parameter mat: The matrix to transpose
/// - returns: The transposed matrix
public func transpose<T: ArithmeticType> (_ mat: tmat4<T>) -> tmat4<T> {
    return tmat4<T>(
        mat.array[0], mat.array[4], mat.array[8], mat.array[12],
        mat.array[1], mat.array[5], mat.array[9], mat.array[13],
        mat.array[2], mat.array[6], mat.array[10], mat.array[14],
        mat.array[3], mat.array[7], mat.array[11], mat.array[15]
    )
}



public func invert<T: ArithmeticType> (_ mat: tmat4<T>) throws -> tmat4<T> {

    let m00 : T = mat.array[0]
    let m10 : T = mat.array[1]
    let m20 : T = mat.array[2]
    let m30 : T = mat.array[3]
    let m01 : T = mat.array[4]
    let m11 : T = mat.array[5]
    let m21 : T = mat.array[6]
    let m31 : T = mat.array[7]
    let m02 : T = mat.array[8]
    let m12 : T = mat.array[9]
    let m22 : T = mat.array[10]
    let m32 : T = mat.array[11]
    let m03 : T = mat.array[12]
    let m13 : T = mat.array[13]
    let m23 : T = mat.array[14]
    let m33 : T = mat.array[15]

    let a0 : T = m00 * m11 - m10 * m01
    let a1 : T = m00 * m21 - m20 * m01
    let a2 : T = m00 * m31 - m30 * m01
    let a3 : T = m10 * m21 - m20 * m11
    let a4 : T = m10 * m31 - m30 * m11
    let a5 : T = m20 * m31 - m30 * m21
    let b0 : T = m02 * m13 - m12 * m03
    let b1 : T = m02 * m23 - m22 * m03
    let b2 : T = m02 * m33 - m32 * m03
    let b3 : T = m12 * m23 - m22 * m13
    let b4 : T = m12 * m33 - m32 * m13
    let b5 : T = m22 * m33 - m32 * m23

    var tmpDet : T = a0 * b5 - a1 * b4 + a2 * b3
    tmpDet += a3 * b2 - a4 * b1 + a5 * b0
    
    guard tmpDet != 0 else {
        throw MatrixError.NonRegular
    }

    let one : T = 1
    let idet : T = one / tmpDet 

    let a11 : T = (m11 * b5 - m21 * b4 + m31 * b3)
    let a21 : T = (-m10 * b5 + m20 * b4 - m30 * b3)
    let a31 : T = (m13 * a5 - m23 * a4 + m33 * a3)
    let a41 : T = (-m12 * a5 + m22 * a4 - m32 * a3)
    let a12 : T = (-m01 * b5 + m21 * b2 - m31 * b1)
    let a22 : T = (m00 * b5 - m20 * b2 + m30 * b1)
    let a32 : T = (-m03 * a5 + m23 * a2 - m33 * a1)
    let a42 : T = (m02 * a5 - m22 * a2 + m32 * a1)
    let a13 : T = (m01 * b4 - m11 * b2 + m31 * b0)
    let a23 : T = (-m00 * b4 + m10 * b2 - m30 * b0)
    let a33 : T = (m03 * a4 - m13 * a2 + m33 * a0)
    let a43 : T = (-m02 * a4 + m12 * a2 - m32 * a0)
    let a14 : T = (-m01 * b3 + m11 * b1 - m21 * b0)
    let a24 : T = (m00 * b3 - m10 * b1 + m20 * b0)
    let a34 : T = (-m03 * a3 + m13 * a1 - m23 * a0)
    let a44 : T = (m02 * a3 - m12 * a1 + m22 * a0)
    
    return tmat4<T>(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44) * idet
}






public func invert (_ mat: mat4i) throws -> mat4f {

    let m00 : Float = Float(mat.array[0])
    let m10 : Float = Float(mat.array[1])
    let m20 : Float = Float(mat.array[2])
    let m30 : Float = Float(mat.array[3])
    let m01 : Float = Float(mat.array[4])
    let m11 : Float = Float(mat.array[5])
    let m21 : Float = Float(mat.array[6])
    let m31 : Float = Float(mat.array[7])
    let m02 : Float = Float(mat.array[8])
    let m12 : Float = Float(mat.array[9])
    let m22 : Float = Float(mat.array[10])
    let m32 : Float = Float(mat.array[11])
    let m03 : Float = Float(mat.array[12])
    let m13 : Float = Float(mat.array[13])
    let m23 : Float = Float(mat.array[14])
    let m33 : Float = Float(mat.array[15])

    let a0 : Float = m00 * m11 - m10 * m01
    let a1 : Float = m00 * m21 - m20 * m01
    let a2 : Float = m00 * m31 - m30 * m01
    let a3 : Float = m10 * m21 - m20 * m11
    let a4 : Float = m10 * m31 - m30 * m11
    let a5 : Float = m20 * m31 - m30 * m21
    let b0 : Float = m02 * m13 - m12 * m03
    let b1 : Float = m02 * m23 - m22 * m03
    let b2 : Float = m02 * m33 - m32 * m03
    let b3 : Float = m12 * m23 - m22 * m13
    let b4 : Float = m12 * m33 - m32 * m13
    let b5 : Float = m22 * m33 - m32 * m23

    var tmpDet : Float = a0 * b5 - a1 * b4 + a2 * b3
    tmpDet += a3 * b2 - a4 * b1 + a5 * b0
    
    guard tmpDet != 0 else {
        throw MatrixError.NonRegular
    }

    let idet : Float = 1.0 / tmpDet
    let a11 : Float = Float(m11 * b5 - m21 * b4 + m31 * b3)
    let a21 : Float = Float(-m10 * b5 + m20 * b4 - m30 * b3)
    let a31 : Float = Float(m13 * a5 - m23 * a4 + m33 * a3)
    let a41 : Float = Float(-m12 * a5 + m22 * a4 - m32 * a3)
    let a12 : Float = Float(-m01 * b5 + m21 * b2 - m31 * b1)
    let a22 : Float = Float(m00 * b5 - m20 * b2 + m30 * b1)
    let a32 : Float = Float(-m03 * a5 + m23 * a2 - m33 * a1)
    let a42 : Float = Float(m02 * a5 - m22 * a2 + m32 * a1)
    let a13 : Float = Float(m01 * b4 - m11 * b2 + m31 * b0)
    let a23 : Float = Float(-m00 * b4 + m10 * b2 - m30 * b0)
    let a33 : Float = Float(m03 * a4 - m13 * a2 + m33 * a0)
    let a43 : Float = Float(-m02 * a4 + m12 * a2 - m32 * a0)
    let a14 : Float = Float(-m01 * b3 + m11 * b1 - m21 * b0)
    let a24 : Float = Float(m00 * b3 - m10 * b1 + m20 * b0)
    let a34 : Float = Float(-m03 * a3 + m13 * a1 - m23 * a0)
    let a44 : Float = Float(m02 * a3 - m12 * a1 + m22 * a0)

    return mat4f(a11, a21, a31, a41, a12, a22, a32, a42, a13, a23, a33, a43, a14, a24, a34, a44) * idet
}
