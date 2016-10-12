//
//  Int.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

extension Int16 : ArithmeticIntType {
    
    public init<T: ArithmeticType> (_ value: T) {
        self.init(value.toInt16())
    }
    
    public func toInt () -> Int {
        return Int(self)
    }
    
    
    public func toInt8 () -> Int8 {
        return Int8(self)
    }
    
    
    public func toInt16 () -> Int16 {
        return Int16(self)
    }
    
    
    public func toInt32 () -> Int32 {
        return Int32(self)
    }
    
    
    public func toInt64 () -> Int64 {
        return Int64(self)
    }
    
    
    
    public func toFloat() -> Float {
        return Float(self)
    }
    
    
    public func toDouble() -> Double {
        return Double(self)
    }
    
    
    public func squareRoot () -> Float
    {
        return Darwin.sqrt(Float(self))
    }
    
    
    public func sin () -> Float {
        return Darwin.sin(Float(self))
    }
    
    
    public func asin () -> Float {
        return Darwin.asin(Float(self))
    }
    
    
    public func cos () -> Float {
        return Darwin.cos(Float(self))
    }
    
    
    public func acos () -> Float {
        return Darwin.acos(Float(self))
    }
    
    
    public func tan () -> Float {
        return Darwin.tan(Float(self))
    }
    
    
    public func atan () -> Float {
        return Darwin.atan(Float(self))
    }
}
