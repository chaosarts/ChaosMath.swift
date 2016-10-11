//
//  basis2.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public struct tbasis2<T: ArithmeticType>: Equatable {
    
    /*
     +--------------------------------------------------------------------------
     | Typealiases
     +--------------------------------------------------------------------------
     */
    
    /// Describes the data type of the components
    public typealias Element = T
    
    /// Describes its own type
    public typealias SelfType = tbasis2<Element>
    
    /// Decribes the VectorType
    public typealias VectorType = tvec2<Element>
    
    /// Decribes the MatrixType
    public typealias MatrixType = tmat2<Element>
    
    /*
     +--------------------------------------------------------------------------
     | Static function
     +--------------------------------------------------------------------------
     */
    
    public static func == (left: SelfType, right: SelfType) -> Bool
    {
        return left.x == right.x && left.y == right.y
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
    
    /// Represents the basis as matrix
    public var mat: MatrixType {
        get {return MatrixType(x, y)}
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Initialisers
     +--------------------------------------------------------------------------
     */
    
    /// Initializes the basis with the standard basis vectors
    public init () {
        self.x = tvec2<Element>.e1
        self.y = tvec2<Element>.e2
    }
    
    
    /// Initializes the basis with given basis vectors
    /// - parameter x: The first basis vector
    /// - parameter y: The second basis vector
    public init (_ x: VectorType, _ y: VectorType) throws {
        guard determinant(x, y) != 0 else {
            throw BasisError.ColinearBase
        }
        
        self.x = x
        self.y = y
    }
    
    
    /// Initializes the basis with a matrix 
    /// - parameter mat: The matrix to adopt the
    public init (_ mat: MatrixType) throws {
        guard mat.det != 0 else {
            throw BasisError.ColinearBase
        }
        
        x = VectorType(mat.array[0], mat.array[1])
        y = VectorType(mat.array[2], mat.array[3])
    }
    
    
    /// Copies a basis
    public init (_ basis: SelfType) {
        x = basis.x
        y = basis.y
    }
}


extension tbasis2 where T: ArithmeticFloatType {
    public init<S: ArithmeticIntType> (_ b: tbasis2<S>) {
        self.x = VectorType(b.x)
        self.y = VectorType(b.y)
    }
}


public typealias basis2i = tbasis2<Int>
public typealias basis2f = tbasis2<Float>
public typealias basis2d = tbasis2<Double>
public typealias basis2 = basis2f


/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation<T: ArithmeticFloatType> (_ from: tbasis2<T>, _ to: tbasis2<T>) -> tmat2<T> {
    do {
        let inverseTo : tmat2<T> = try invert(to.mat)
        return inverseTo * from.mat
    }
    catch {
        // Won't be reached anyway. Matrix of basis are ensured to be invertible
        return tmat2<T>()
    }
}


/// Returns the transformation matrix from one basis to another
/// - parameter from: The basis to transform from
/// - parameter to: The basis to transform to
/// - returns: The transformation matrix
public func transformation<T: ArithmeticIntType> (_ from: tbasis2<T>, _ to: tbasis2<T>) -> mat2f {
    do {
        let invertedMat : mat2f = try invert(to.mat)
        return invertedMat * mat2f(from.mat)
    } catch {
        // Won't be reached anyway. Matrix of basis are ensured to be invertible
     	return mat2f()
    }
}


