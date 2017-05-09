//
//  basis2.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis2<T: ArithmeticScalarType>: Equatable {
    
    /*
     +--------------------------------------------------------------------------
     | Typealiases
     +--------------------------------------------------------------------------
     */
    
    /// Describes the data type of the components
    public typealias ElementType = T
    
    /// Describes its own type
    public typealias SelfType = tbasis2<ElementType>
    
    /// Decribes the VectorType
    public typealias VectorType = tvec2<ElementType>
    
    /// Decribes the MatrixType
    public typealias MatrixType = tmat2<ElementType>

    
    /*
     +--------------------------------------------------------------------------
 	 | Stored properties
 	 +--------------------------------------------------------------------------
	 */
    
    /// Provides the first vector of the basis
    public let b1: VectorType
    
    /// Provides the second vector of the basis
    public let b2: VectorType
    

    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */


    /// Provides the first basis vector
    public var x: VectorType {
        return b1
    }

    /// Provides the first basis vector
    public var y: VectorType {
        return b2
    }

    /// Represents the basis as matrix
    public var mat: MatrixType {
        return MatrixType(b1, b2)
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
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter b1: The first basis vector
    /// - parameter b2: The second basis vector
    public init?<ForeignType: ArithmeticScalarType> (_ b1: tvec2<ForeignType>, _ b2: tvec2<ForeignType>) {
        if determinant(b1, b2) == 0 {
            return nil
        }
        
        self.b1 = VectorType(b1)
        self.b2 = VectorType(b2)
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init?<ForeignType: ArithmeticScalarType> (_ mat: tmat2<ForeignType>) {
        let determinant : ForeignType = mat.det
        if determinant == 0 {
            return nil    
        }
        
        b1 = VectorType(mat.array[0], mat.array[1])
        b2 = VectorType(mat.array[2], mat.array[3])
    }
    
    
    /// Copies a basis
    public init<ForeignType: ArithmeticScalarType> (_ basis: tbasis2<ForeignType>) {
        b1 = VectorType(basis.b1)
        b2 = VectorType(basis.b2)
    }
}


public typealias basis2i = tbasis2<Int>
public typealias basis2f = tbasis2<Float>
public typealias basis2d = tbasis2<Double>
public typealias basis2 = basis2f
    

/*
 +------------------------------------------------------------------------------
 | Operators
 +------------------------------------------------------------------------------
 */

public func ==<ElementType: ArithmeticScalarType> (left: tbasis2<ElementType>, right: tbasis2<ElementType>) -> Bool {
    return left.b1 == right.b1 && left.b2 == right.b2
}


/*
 +------------------------------------------------------------------------------
 | Functions
 +------------------------------------------------------------------------------
 */


/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation<T: ArithmeticIntType> (fromBasis from: tbasis2<T>, toBasis to: tbasis2<T>) -> mat2f {
    let invertedMat : mat2f = try! invert(to.mat)
    return invertedMat * mat2f(from.mat)
}


/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation<T: ArithmeticFloatType> (fromBasis from: tbasis2<T>, toBasis to: tbasis2<T>) -> tmat2<T> {
    let inverseTo : tmat2<T> = try! invert(to.mat)
    return inverseTo * from.mat
}


/// Returns the orthognal version of given basis
/// - parameter basis: The basis to orthogonalize
/// - parameter normalize: Indicates, whether to normalize the basis or not
public func gramschmidt<T: ArithmeticScalarType> (_ basis: tbasis2<T>, _ normalize: Bool = false) -> tbasis2<Float>? {
    return gramschmidt(basis.b1, basis.b2)
}


/// Returns a orthogonal basis out of the given two vectors, if not collinear
/// - parameter w1: The first vector
/// - parameter w2: The second vector
/// - parameter normalize: Indicates, whether to normalize the basis or not
public func gramschmidt<T: ArithmeticScalarType> (_ w1: tvec2<T>, _ w2: tvec2<T>, _ normalize: Bool = false) -> tbasis2<Float>? {
    if determinant(w1, w2) == 0 {
        return nil
    }
    
    var v1 : tvec2<Float> = tvec2<Float>(w1)
    var v2 : tvec2<Float> = tvec2<Float>(w2)
    v2 -= dot(v1, v2) / dot(v1, v1) * v1
    
    if normalize {
        v1 = ChaosMath.normalize(v1)
        v2 = ChaosMath.normalize(v2)
    }
    
    return tbasis2<Float>(v1, v2)
}


/// Returns a orthogonal basis out of the given two vectors, if not collinear
/// - parameter w1: The first vector
/// - parameter w2: The second vector
/// - parameter normalize: Indicates, whether to normalize the basis or not
public func gramschmidt (_ w1: vec2d, _ w2: vec2d, _ normalize: Bool = false) -> basis2d? {
    if determinant(w1, w2) == 0 {
        return nil
    }
    
    var v1 : vec2d = w1
    var v2 : vec2d = w2 - dot(v1, w2) / dot(v1, v1) * v1
    
    if normalize {
        v1 = ChaosMath.normalize(v1)
        v2 = ChaosMath.normalize(v2)
    }
    
    return basis2d(v1, v2)
}


