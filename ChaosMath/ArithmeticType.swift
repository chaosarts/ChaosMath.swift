//
//  ArithmeticType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation


public protocol ArithmeticType : Comparable, CustomStringConvertible
{
	static prefix func - (value: Self) -> Self;
	static func + (left: Self, right: Self) -> Self
	static func - (left: Self, right: Self) -> Self
	static func * (left: Self, right: Self) -> Self
	static func / (left: Self, right: Self) -> Self
    static func += (left: inout Self, right: Self)
    static func -= (left: inout Self, right: Self)
    static func *= (left: inout Self, right: Self)
    static func /= (left: inout Self, right: Self)
}


public protocol ArithmeticScalarType : ArithmeticType, SignedNumber, ExpressibleByIntegerLiteral {

    init<T: ArithmeticScalarType> (_ value: T)
    
    func toInt () -> Int
    func toInt8 () -> Int8
    func toInt16 () -> Int16
    func toInt32 () -> Int32
    func toInt64 () -> Int64
    func toFloat () -> Float
    func toDouble () -> Double
}


public protocol ArithmeticIntType : ArithmeticScalarType {
    func sqrt () -> Float
    func sin () -> Float
    func asin () -> Float
    func cos() -> Float
    func acos() -> Float
    func tan () -> Float
    func atan () -> Float
}


public protocol ArithmeticFloatType : ArithmeticScalarType, BinaryFloatingPoint, ExpressibleByFloatLiteral {
    func sqrt () -> Self
    func sin () -> Self
    func asin () -> Self
    func cos() -> Self
    func acos() -> Self
    func tan () -> Self
    func atan () -> Self
}
