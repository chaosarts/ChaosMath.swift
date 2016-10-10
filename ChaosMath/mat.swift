//
//  mat.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosCore


/// Describes the definition of a matrix type
public protocol MatrixType : ExpressibleByArrayLiteral, Equatable, CustomStringConvertible {
    
    /// Provides the row count of the matrix type
    static var rowCount : Int {get}
    
    /// Provides the col count of the matrix type
    static var colCount : Int {get}
    
    /// 
    static var identity : Self {get}
}


/// Enumerates matrix errors
public enum MatrixError : Error {
    case NonRegular
    case OutOfBoundsIndex
}
