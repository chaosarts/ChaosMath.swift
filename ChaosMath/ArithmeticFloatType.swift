//
//  ArithmeticFloatType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 26.04.17.
//  Copyright © 2017 Fu Lam Diep. All rights reserved.
//

import Foundation

/// Describes the type for float type with arithmetic behaviour
public protocol ArithmeticFloatType : ArithmeticScalarType, BinaryFloatingPoint, ExpressibleByFloatLiteral {
    func sqrt () -> Self
    func sin () -> Self
    func asin () -> Self
    func cos() -> Self
    func acos() -> Self
    func tan () -> Self
    func atan () -> Self
}
