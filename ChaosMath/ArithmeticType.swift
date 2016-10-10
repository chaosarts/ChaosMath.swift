//
//  ArithmeticType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation


public protocol ArithmeticType : ExpressibleByIntegerLiteral, Comparable, CustomStringConvertible
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


public protocol ArithmeticFloatType : ArithmeticType, ExpressibleByFloatLiteral {
}

extension Int : ArithmeticType {}
extension Float : ArithmeticFloatType {}
extension Double : ArithmeticFloatType {}
