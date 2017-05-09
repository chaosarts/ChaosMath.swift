//
//  ArithmeticScalarType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 26.04.17.
//  Copyright © 2017 Fu Lam Diep. All rights reserved.
//

import Foundation


public protocol ArithmeticScalarType : ArithmeticType, SignedNumber, ExpressibleByIntegerLiteral {
    
    init<T: ArithmeticScalarType> (_ value: T)
    
    static func / (left: Self, right: Self) -> Self
    static func /= (left: inout Self, right: Self)
    
    func toInt () -> Int
    func toInt8 () -> Int8
    func toInt16 () -> Int16
    func toInt32 () -> Int32
    func toInt64 () -> Int64
    func toFloat () -> Float
    func toDouble () -> Double
}
