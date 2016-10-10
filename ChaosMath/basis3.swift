//
//  basis3.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis3<T: ArithmeticType>: Equatable {
    
    /*
     +--------------------------------------------------------------------------
     | Typealiases
     +--------------------------------------------------------------------------
     */
    
    /// Describes the data type of the components
    public typealias ElementType = T
    
    /// Describes its own type
    public typealias SelfType = tbasis3<ElementType>
    
    /// Decribes the VectorType
    public typealias VectorType = tvec3<ElementType>
    
    /// Decribes the MatrixType
    public typealias MatrixType = tmat3<ElementType>
    
    /*
     +--------------------------------------------------------------------------
     | Static function
     +--------------------------------------------------------------------------
     */
    
    public static func == (left: SelfType, right: SelfType) -> Bool
    {
        return left.x == right.x && left.y == right.y && left.z == right.z
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
    
    /// Represents the basis as matrix
    public var mat: MatrixType {
        get {return MatrixType(x, y, z)}
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
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter x: The first basis vector
    /// - parameter y: The second basis vector
    public init (_ x: VectorType, _ y: VectorType, _ z: VectorType) throws {
        guard determinant(x, y, z) != 0 else {
            throw BasisError.ColinearBase
        }
        
        self.x = x
        self.y = y
        self.z = z
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init (_ mat: MatrixType) throws {
        guard mat.det != 0 else {
            throw BasisError.ColinearBase
        }
        
        x = VectorType(mat.array[0], mat.array[1], mat.array[2])
        y = VectorType(mat.array[3], mat.array[4], mat.array[5])
        z = VectorType(mat.array[6], mat.array[7], mat.array[8])
    }
    
    
    /// Copies a basis
    public init (_ basis: SelfType) {
        x = basis.x
        y = basis.y
        z = basis.z
    }
}


public typealias basis3i = tbasis3<Int>
public typealias basis3f = tbasis3<Float>
public typealias basis3d = tbasis3<Double>
public typealias basis3 = basis3f

/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation (_ from: basis3i, _ to: basis3i) -> mat3f {
    do {
        let invertedMat : mat3f = try invert(to.mat)
        let floatMat : mat3f = mat3f(
            Float(from.x.x), Float(from.x.y), Float(from.x.z),
            Float(from.y.x), Float(from.y.y), Float(from.y.z),
            Float(from.z.x), Float(from.z.y), Float(from.z.z)
        )
        return invertedMat * floatMat
    } catch {
        // Won't be reached anyway. Matrix of basis are ensured to be invertible
        return mat3f()
    }
}


public func transformation<T: ArithmeticType> (_ from: tbasis3<T>, _ to: tbasis3<T>) -> tmat3<T> {
    do {
        let inverseTo : tmat3<T> = try invert(to.mat)
        return inverseTo * from.mat
    }
    catch {
        return tmat3<T>()
    }
}
