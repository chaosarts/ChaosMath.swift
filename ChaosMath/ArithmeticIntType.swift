//
//  ArithmeticIntType.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 26.04.17.
//  Copyright © 2017 Fu Lam Diep. All rights reserved.
//

import Foundation

public protocol ArithmeticIntType : ArithmeticScalarType {
    func sqrt () -> Float
    func sin () -> Float
    func asin () -> Float
    func cos() -> Float
    func acos() -> Float
    func tan () -> Float
    func atan () -> Float
}
