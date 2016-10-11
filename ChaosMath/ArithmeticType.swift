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
    func toFloat () -> Float
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
    init<T: ArithmeticIntType> (_ value: T)
    func sin () -> Self
    func asin () -> Self
    func cos() -> Self
    func acos() -> Self
    func tan () -> Self
    func atan () -> Self
}
