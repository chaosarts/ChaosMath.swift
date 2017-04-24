//
//  basis4.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis4<T: ArithmeticScalarType>: Equatable {
    
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
     | Stored properties
     +--------------------------------------------------------------------------
     */

    /// Provides the first vector of the basis
    public let b1 : VectorType
    
    /// Provides the second vector of the basis
    public let b2 : VectorType

    /// Provides the third vector of the basis
    public let b3 : VectorType

    /// Provides the fourth vector of the basis
    public let b4 : VectorType

    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
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

    /// Provides the fourth vector of the basis
    public var w: VectorType {
        return b4
    }
    
    /// Represents the basis as matrix
    public var mat: MatrixType {
        return MatrixType(x, y, z, w)
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initialisers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the basis with the standard basis vectors
    public init () {
        self.b1 = VectorType.e1
        self.b2 = VectorType.e2
        self.b3 = VectorType.e3
        self.b4 = VectorType.e4
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter b1: The first basis vector
    /// - parameter b2: The second basis vector
    /// - parameter b3: The second basis vector
    /// - parameter b4: The second basis vector
    public init?<ForeignType: ArithmeticScalarType> (_ b1: tvec4<ForeignType>, _ b2: tvec4<ForeignType>, _ b3: tvec4<ForeignType>, _ b4: tvec4<ForeignType>) {
        if determinant(b1, b2, b3, b4) == 0 {
            return nil
        }
        
        self.b1 = VectorType(b1)
        self.b2 = VectorType(b2)
        self.b3 = VectorType(b3)
        self.b4 = VectorType(b4)
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init?<ForeignType: ArithmeticScalarType> (_ mat: tmat4<ForeignType>) {
        if mat.det == 0 {
            return nil
        }
        
        b1 = VectorType(mat.array[0], mat.array[1], mat.array[2], mat.array[3])
        b2 = VectorType(mat.array[4], mat.array[5], mat.array[6], mat.array[7])
        b3 = VectorType(mat.array[8], mat.array[9], mat.array[10], mat.array[11])
        b4 = VectorType(mat.array[12], mat.array[13], mat.array[14], mat.array[15])
    }
    
    
    /// Copies a basis
    public init<ForeignType: ArithmeticScalarType> (_ basis: tbasis4<ForeignType>) {
        b1 = VectorType(basis.b1)
        b2 = VectorType(basis.b2)
        b3 = VectorType(basis.b3)
        b4 = VectorType(basis.b4)
    }
}


public typealias basis4i = tbasis4<Int>
public typealias basis4f = tbasis4<Float>
public typealias basis4d = tbasis4<Double>
public typealias basis4 = basis4f
    
/*
 +------------------------------------------------------------------------------
 | Operators
 +------------------------------------------------------------------------------
 */

public func ==<ElementType: ArithmeticScalarType> (left: tbasis4<ElementType>, right: tbasis4<ElementType>) -> Bool {
    return left.b1 == right.b1 && left.b2 == right.b2 && left.b3 == right.b3 && left.b4 == right.b4
}

///// Returns the transformation matrix from one basis to another
///// - parameter from: The basis to transform from
///// - parameter to: The basis to transform to
///// - returns: The transformation matrix
//public func transformation<T: ArithmeticFloatType> (_ from: tbasis4<T>, _ to: tbasis4<T>) -> tmat4<T> {
//    do {
//        let inverseTo : tmat4<T> = try invert(to.mat)
//        return inverseTo * from.mat
//    }
//    catch {
//        return tmat4<T>()
//    }
//}
//
//
///// Returns the transformation matrix from one basis to another
///// - parameter from: The basis to transform from
///// - parameter to: The basis to transform to
///// - returns: The transformation matrix
//public func transformation<T: ArithmeticIntType> (_ from: tbasis4<T>, _ to: tbasis4<T>) -> tmat4<Float> {
//    do {
//        let inverseTo : tmat4<Float> = try invert(to.mat)
//        return inverseTo * basis4f(from).mat
//    }
//    catch {
//        return tmat4<Float>()
//    }
//}
