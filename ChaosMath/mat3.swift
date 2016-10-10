//
//  SelfType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import ChaosCore
import Foundation

public struct tmat3<T: ArithmeticType> : MatrixType {

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
    | Operators
    +--------------------------------------------------------------------------
    */
    
    /// Negates the given matrix
    /// - parameter mat: The matrix to negate
    /// - returns: The negated matrix
    public static prefix func - (mat: SelfType) -> SelfType {
        return SelfType(-mat.array[0], -mat.array[1], -mat.array[2],
            -mat.array[3], -mat.array[4], -mat.array[5],
            -mat.array[6], -mat.array[7], -mat.array[8]) 
    }
    
    
    /// Calculates the component wise sum of two matrices
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The sum of the matrices
    public static func + (left: SelfType, right: SelfType) -> SelfType {
        return SelfType(
            left.array[0] + right.array[0], left.array[1] + right.array[1], left.array[2] + right.array[2],
            left.array[3] + right.array[3], left.array[4] + right.array[4], left.array[5] + right.array[5],
            left.array[6] + right.array[6], left.array[7] + right.array[7], left.array[8] + right.array[8]
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
        let a11 : ElementType = left.array[0] * right.array[0] + left.array[3] * right.array[1] + left.array[6] * right.array[2]
        let a21 : ElementType = left.array[1] * right.array[0] + left.array[4] * right.array[1] + left.array[7] * right.array[2]
        let a31 : ElementType = left.array[2] * right.array[0] + left.array[5] * right.array[1] + left.array[8] * right.array[2]

        let a12 : ElementType = left.array[0] * right.array[3] + left.array[3] * right.array[4] + left.array[6] * right.array[5]
        let a22 : ElementType = left.array[1] * right.array[3] + left.array[4] * right.array[4] + left.array[7] * right.array[5]
        let a32 : ElementType = left.array[2] * right.array[3] + left.array[5] * right.array[4] + left.array[8] * right.array[5]

        let a13 : ElementType = left.array[0] * right.array[6] + left.array[3] * right.array[7] + left.array[6] * right.array[8]
        let a23 : ElementType = left.array[1] * right.array[6] + left.array[4] * right.array[7] + left.array[7] * right.array[8]
        let a33 : ElementType = left.array[2] * right.array[6] + left.array[5] * right.array[7] + left.array[8] * right.array[8]

        return SelfType(a11, a12, a13, a21, a22, a23, a31, a32, a33)
    }
    
    
    /// Calculates the right side multiplication
    /// - parameter mat:
    /// - parameter vec:
    /// - returns: The resulting vector of the multiplication
    public static func * (vec: VectorType, mat: SelfType) -> VectorType {
        var x : ElementType = 0, y : ElementType = 0, z : ElementType = 0
        x += vec.x * mat.array[0]
        x += vec.y * mat.array[1]
		x += vec.z * mat.array[2]
        
        y += vec.x * mat.array[3]
        y += vec.y * mat.array[4]
        y += vec.z * mat.array[5]
        
        z += vec.x * mat.array[6]
        z += vec.y * mat.array[7]
        z += vec.z * mat.array[8]

        return VectorType(x, y, z)
    }

    /// Calculates the left side multiplication
    /// - parameter mat:
    /// - parameter vec:
    /// - returns: The resulting vector of the multiplication
    public static func * (mat: SelfType, vec: VectorType) -> VectorType {
        var x : ElementType = 0, y : ElementType = 0, z : ElementType = 0
        
        x += vec.x * mat.array[0]
        x += vec.y * mat.array[3]
        x += vec.z * mat.array[6]
        
        y += vec.x * mat.array[1]
        y += vec.y * mat.array[4]
        y += vec.z * mat.array[7]
        
        z += vec.x * mat.array[2]
        z += vec.y * mat.array[5]
        z += vec.z * mat.array[8]

        return VectorType(x, y, z)
    }
    
    
    /// Calculates the product of a scalar and a matrix
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    /// - returns: The product of the matrix and scalar
    public static func * (left: ElementType, right: SelfType) -> SelfType {
        let a11 : ElementType = left * right.array[0]
        let a21 : ElementType = left * right.array[1]
        let a31 : ElementType = left * right.array[2]

        let a12 : ElementType = left * right.array[3]
        let a22 : ElementType = left * right.array[4]
        let a32 : ElementType = left * right.array[5]

        let a13 : ElementType = left * right.array[6]
        let a23 : ElementType = left * right.array[7]
        let a33 : ElementType = left * right.array[8]

        return SelfType(a11, a12, a13, a21, a22, a23, a31, a32, a33)
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
        let one : ElementType = 1
        return left * (one / right)
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter rught: The right operand
    public static func += (left: inout SelfType, right: SelfType) {
        left = left + right
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    public static func -= (left: inout SelfType, right: SelfType) {
        left = left - right
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    public static func *= (left: inout SelfType, right: SelfType) {
        left = left * right
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter right: The right operand
    public static func *= (left: inout SelfType, right: ElementType) {
        left = left * right
    }
    
    
    /// Compund operator for addition
    /// - parameter left: The left operand
    /// - parameter right: The right operand
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
            do {return try determinant(col(0), col(1), col(2))}
            catch {return 0}
        }
    }
    
    /// Provides the list of row vectors
    public var rows : Array<VectorType> {
        get {
            do {return try [row(0), row(1), row(2)]}
            catch {return []}
        }
    }
    
    /// Provides the list of col vectors
    public var cols : Array<VectorType> {
        get {
            do {return try [col(0), col(1), col(2)]}
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
    public init (_ a11: ElementType, _ a21: ElementType, _ a31: ElementType, 
        _ a12: ElementType, _ a22: ElementType, _ a32: ElementType,
        _ a13: ElementType, _ a23: ElementType, _ a33: ElementType) {
        array = [a11, a21, a31, a12, a22, a32, a13, a23, a33]
    }
    
    
    /// Initializes the a diagonal matrix
    /// - parameter value: The value of the components with index i = j
    public init (_ value: ElementType) {
        array = [value, 0, 0, 0, value, 0, 0, 0, value]
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
    }
    
    
    /// Initializer for ExpressableByArrayLiteral
    public init(arrayLiteral elements: ElementType...) {
        self.init(elements)
    }
    
    
    /// Initializes the matrix with two column vectors
    /// - parameter a1: The first column
    /// - parameter a2: The second column
    public init (_ a1: VectorType, _ a2: VectorType, _ a3: VectorType) {
        array = a1.array
        array.append(contentsOf: a2.array)
        array.append(contentsOf: a3.array)
    }
    
    
    /// Returns the components of the i-th row as vector
    /// - parameter i: Index of the row to return
    /// - returns: The row vector at index i
    public func row (_ i: Int) throws -> VectorType {
        
		guard i >= 0 && i < SelfType.rowCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        return VectorType(array[i], array[i + SelfType.colCount], array[i + SelfType.colCount + SelfType.colCount])
    }
    
    
    /// Returns the components of the i-th col as vector
    /// - parameter i: Index of the column to return
    /// - returns: The column vector at index i
    public func col (_ i: Int) throws -> VectorType {
        
        guard i >= 0 && i < SelfType.rowCount else {
            throw MatrixError.OutOfBoundsIndex
        }
        
        let baseIndex : Int = i * SelfType.rowCount
        return VectorType(array[baseIndex], array[baseIndex + 1], array[baseIndex + 2])
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

/// Transposes the matrix
/// - parameter mat: The matrix to transpose
/// - returns: The transposed matrix
public func transpose<T: ArithmeticType> (_ mat: tmat3<T>) -> tmat3<T> {
    return tmat3<T>(
        mat.array[0], mat.array[3], mat.array[6],
        mat.array[1], mat.array[4], mat.array[7],
        mat.array[2], mat.array[5], mat.array[8]
    )
}


/// Inverts a 3x3 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverse matrix
public func invert<T: ArithmeticType> (_ mat: tmat3<T>) throws -> tmat3<T> {
    let det : T = mat.det
    guard det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let a11 : T = (mat.array[4] * mat.array[8] - mat.array[7] * mat.array[5])
    let a21 : T = (mat.array[7] * mat.array[2] - mat.array[1] * mat.array[8])
    let a31 : T = (mat.array[1] * mat.array[5] - mat.array[4] * mat.array[2])
    
    let a12 : T = (mat.array[6] * mat.array[5] - mat.array[3] * mat.array[8])
    let a22 : T = (mat.array[0] * mat.array[8] - mat.array[6] * mat.array[2])
    let a32 : T = (mat.array[3] * mat.array[2] - mat.array[0] * mat.array[5])
    
    let a13 : T = (mat.array[3] * mat.array[7] - mat.array[6] * mat.array[4])
    let a23 : T = (mat.array[6] * mat.array[1] - mat.array[0] * mat.array[7])
    let a33 : T = (mat.array[0] * mat.array[4] - mat.array[3] * mat.array[1])

    return tmat3<T>(a11, a21, a31, a12, a22, a32, a13, a23, a33) / det
}


/// Inverts a 3x3 matrix
/// - parameter mat: The matrix to invert
/// - returns: The inverse matrix
public func invert (_ mat: mat3i) throws -> mat3f {
    let det : Int = mat.det
    
    guard det != 0 else {
        throw MatrixError.NonRegular
    }
    
    let idet : Float = 1.0 / Float(det)
    
    let a11 : Float = Float(mat.array[4] * mat.array[8] - mat.array[7] * mat.array[5])
    let a21 : Float = Float(mat.array[7] * mat.array[2] - mat.array[1] * mat.array[8])
    let a31 : Float = Float(mat.array[1] * mat.array[5] - mat.array[4] * mat.array[2])
    
    let a12 : Float = Float(mat.array[6] * mat.array[5] - mat.array[3] * mat.array[8])
    let a22 : Float = Float(mat.array[0] * mat.array[8] - mat.array[6] * mat.array[2])
    let a32 : Float = Float(mat.array[3] * mat.array[2] - mat.array[0] * mat.array[5])
    
    let a13 : Float = Float(mat.array[3] * mat.array[7] - mat.array[6] * mat.array[4])
    let a23 : Float = Float(mat.array[6] * mat.array[1] - mat.array[0] * mat.array[7])
    let a33 : Float = Float(mat.array[0] * mat.array[4] - mat.array[3] * mat.array[1])
    
    return tmat3<Float>(a11, a21, a31, a12, a22, a32, a13, a23, a33) * idet
}
