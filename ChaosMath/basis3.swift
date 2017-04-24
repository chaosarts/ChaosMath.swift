//
//  basis3.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis3<T: ArithmeticScalarType>: Equatable {
    
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
     | Stored properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the first vector of the basis
    public let b1: VectorType
    
    /// Provides the second vector of the basis
    public let b2: VectorType

    /// Provides the third vector of the basis
    public let b3: VectorType
    
    
    /*
     +--------------------------------------------------------------------------
     | Stored properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the first vector of the basis
    public var x: VectorType {
        return b1
    }
    
    /// Provides the second vector of the basis
    public var y: VectorType {
        return b2
    }

    /// Provides the third vector of the basis
    public var z: VectorType {
        return b3
    }
    
    /// Represents the basis as matrix
    public var mat: MatrixType {
        return MatrixType(x, y, z)
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initialisers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the basis with the standard basis vectors
    public init () {
        b1 = VectorType.e1
        b2 = VectorType.e2
        b3 = VectorType.e3
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter b1: The first basis vector
    /// - parameter b2: The second basis vector
    /// - parameter b3: The second basis vector
    public init?<ForeignType: ArithmeticScalarType> (_ b1: tvec3<ForeignType>, _ b2: tvec3<ForeignType>, _ b3: tvec3<ForeignType>) {
        if determinant(b1, b2, b3) == 0 {
            return nil
        }
        
        self.b1 = VectorType(b1)
        self.b2 = VectorType(b2)
        self.b3 = VectorType(b3)
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init?<ForeignType: ArithmeticScalarType> (_ mat: tmat3<ForeignType>) {
        if mat.det == 0 {
            return nil
        }
        
        b1 = VectorType(mat.array[0], mat.array[1], mat.array[2])
        b2 = VectorType(mat.array[3], mat.array[4], mat.array[5])
        b3 = VectorType(mat.array[6], mat.array[7], mat.array[8])
    }
    
    
    /// Copies a basis
    public init<ForeignType: ArithmeticScalarType> (_ basis: tbasis3<ForeignType>) {
        b1 = VectorType(basis.b1)
        b2 = VectorType(basis.b2)
        b3 = VectorType(basis.b3)
    }
}


public typealias basis3i = tbasis3<Int>
public typealias basis3f = tbasis3<Float>
public typealias basis3d = tbasis3<Double>
public typealias basis3 = basis3f
    
/*
 +--------------------------------------------------------------------------
 | Static function
 +--------------------------------------------------------------------------
 */

public func ==<ElementType: ArithmeticScalarType> (left: tbasis3<ElementType>, right: tbasis3<ElementType>) -> Bool {
    return left.b1 == right.b1 && left.b2 == right.b2 && left.b3 == right.b3
}

///// Returns the transformation matrix from one basis to another
///// - parameter from: The basis to transform from
///// - parameter to: The basis to transform to
///// - returns: The transformation matrix
//public func transformation (_ from: basis3i, _ to: basis3i) -> mat3f {
//    do {
//        let invertedMat : mat3f = try invert(to.mat)
//        let floatMat : mat3f = mat3f(
//            Float(from.b1.b1), Float(from.b1.b2), Float(from.b1.b3),
//            Float(from.b2.b1), Float(from.b2.b2), Float(from.b2.b3),
//            Float(from.b3.b1), Float(from.b3.b2), Float(from.b3.b3)
//        )
//        return invertedMat * floatMat
//    } catch {
//        // Won't be reached anyway. Matrix of basis are ensured to be invertible
//        return mat3f()
//    }
//}
//
//
//public func transformation<T: ArithmeticScalarType> (_ from: tbasis3<T>, _ to: tbasis3<T>) -> tmat3<T> {
//    do {
//        let inverseTo : tmat3<T> = try invert(to.mat)
//        return inverseTo * from.mat
//    }
//    catch {
//        return tmat3<T>()
//    }
//}
