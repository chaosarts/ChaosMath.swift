//
//  basis4.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis4<T: ArithmeticType>: Equatable {
    
    /*
     +--------------------------------------------------------------------------
     | Typealiases
     +--------------------------------------------------------------------------
     */
    
    /// Describes the data type of the components
    public typealias ElementType = T
    
    /// Describes its own type
    public typealias SelfType = tbasis4<ElementType>
    
    /// Decribes the VectorType
    public typealias VectorType = tvec4<ElementType>
    
    /// Decribes the MatrixType
    public typealias MatrixType = tmat4<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static function
     +--------------------------------------------------------------------------
     */
    
    public static func == (left: SelfType, right: SelfType) -> Bool
    {
        return left.x == right.x && left.y == right.y && left.z == right.z && left.w == right.w
    }
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the first vector of the basis
    public let x: VectorType
    
    /// Provides the second vector of the basis
    public let y: VectorType

    /// Provides the third vector of the basis
    public let z: VectorType

    /// Provides the fourth vector of the basis
    public let w: VectorType
    
    /// Represents the basis as matrix
    public var mat: MatrixType {
        get {return MatrixType(x, y, z, w)}
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initialisers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the basis with the standard basis vectors
    public init () {
        self.x = VectorType.e1
        self.y = VectorType.e2
        self.z = VectorType.e3
        self.w = VectorType.e4
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter x: The first basis vector
    /// - parameter y: The second basis vector
    public init (_ x: VectorType, _ y: VectorType, _ z: VectorType, _ w: VectorType) throws {
        guard determinant(x, y, z, w) != 0 else {
            throw BasisError.ColinearBase
        }
        
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init (_ mat: MatrixType) throws {
        guard mat.det != 0 else {
            throw BasisError.ColinearBase
        }
        
        x = VectorType(mat.array[0], mat.array[1], mat.array[2], mat.array[3])
        y = VectorType(mat.array[4], mat.array[5], mat.array[6], mat.array[7])
        z = VectorType(mat.array[8], mat.array[9], mat.array[10], mat.array[11])
        w = VectorType(mat.array[12], mat.array[13], mat.array[14], mat.array[15])
    }
    
    
    /// Copies a basis
    public init (_ basis: SelfType) {
        x = basis.x
        y = basis.y
        z = basis.z
        w = basis.w
    }
}


public typealias basis4i = tbasis4<Int>
public typealias basis4f = tbasis4<Float>
public typealias basis4d = tbasis4<Double>
public typealias basis4 = basis4f

/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation (_ from: basis4i, _ to: basis4i) -> mat4f {
    do {
        let invertedMat : mat4f = try invert(to.mat)
        let floatMat : mat4f = mat4f(
            Float(from.x.x), Float(from.x.y), Float(from.x.z), Float(from.x.w),
            Float(from.y.x), Float(from.y.y), Float(from.y.z), Float(from.y.w),
            Float(from.z.x), Float(from.z.y), Float(from.z.z), Float(from.z.w),
            Float(from.w.x), Float(from.w.y), Float(from.w.z), Float(from.w.w)
        )
        return invertedMat * floatMat
    } catch {
        // Won't be reached anyway. Matrix of basis are ensured to be invertible
        return mat4f()
    }
}


public func transformation<T: ArithmeticType> (_ from: tbasis4<T>, _ to: tbasis4<T>) -> tmat4<T> {
    do {
        let inverseTo : tmat4<T> = try invert(to.mat)
        return inverseTo * from.mat
    }
    catch {
        return tmat4<T>()
    }
}
