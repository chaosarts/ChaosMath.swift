//
//  ArithmeticType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation


public protocol ArithmeticType : SignedNumber, ExpressibleByIntegerLiteral, Comparable, CustomStringConvertible
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
 	
    init<T: ArithmeticType> (_ value: T)
    init(_ value: Int)
    init(_ value: Int8)
    init(_ value: Int16)
    init(_ value: Int32)
    init(_ value: Int64)
    init(_ value: Float)
    init(_ value: Double)
    
    func toInt () -> Int
    func toInt8 () -> Int8
    func toInt16 () -> Int16
    func toInt32 () -> Int32
    func toInt64 () -> Int64
    func toFloat () -> Float
    func toDouble () -> Double
}


public protocol ArithmeticIntType : ArithmeticType {
    func squareRoot () -> Float
    func sin () -> Float
    func asin () -> Float
    func cos() -> Float
    func acos() -> Float
    func tan () -> Float
    func atan () -> Float
}


public protocol ArithmeticFloatType : BinaryFloatingPoint, ExpressibleByFloatLiteral, ArithmeticType {
    func sin () -> Self
    func asin () -> Self
    func cos() -> Self
    func acos() -> Self
    func tan () -> Self
    func atan () -> Self
}
