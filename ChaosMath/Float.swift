//
//  Float.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

extension Float : ArithmeticFloatType {
    
    public init<T: ArithmeticScalarType> (_ value: T) {
        self.init(value.toFloat())
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
        return self
    }
    
    
    public func toDouble() -> Double {
        return Double(self)
    }
    
    
    public func sqrt() -> Float {
        return Darwin.sqrt(self)
    }
    
    
    public func sin () -> Float {
        return Darwin.sin(self)
    }
    
    
    public func asin () -> Float {
        return Darwin.asin(self)
    }
    
    
    public func cos () -> Float {
        return Darwin.cos(self)
    }
    
    
    public func acos () -> Float {
        return Darwin.acos(self)
    }
    
    
    public func tan () -> Float {
        return Darwin.tan(self)
    }
    
    
    public func atan () -> Float {
        return Darwin.atan(self)
    }
}


public func +<T: ArithmeticIntType> (_ left: Float, _ right: T) -> Float {
    return left + right.toFloat()
}


public func +<T: ArithmeticIntType> (_ left: T, _ right: Float) -> Float {
    return right + left
}


public func -<T: ArithmeticIntType> (_ left: Float, _ right: T) -> Float {
    return left - right.toFloat()
}


public func -<T: ArithmeticIntType> (_ left: T, _ right: Float) -> Float {
    return -right + left
}


public func *<T: ArithmeticIntType> (_ left: Float, _ right: T) -> Float {
    return left * right.toFloat()
}


public func *<T: ArithmeticIntType> (_ left: T, _ right: Float) -> Float {
    return right * left
}


public func /<T: ArithmeticIntType> (_ left: Float, _ right: T) -> Float {
    return left / right.toFloat()
}


public func /<T: ArithmeticIntType> (_ left: T, _ right: Float) -> Float {
    return left.toFloat() / right
}


public func +=<T: ArithmeticIntType> (_ left: inout Float, _ right: T) {
    left = left + right
}


public func -=<T: ArithmeticIntType> (_ left: inout Float, _ right: T) {
    left = left - right
}


public func *=<T: ArithmeticIntType> (_ left: inout Float, _ right: T) {
    left = left * right
}


public func /=<T: ArithmeticIntType> (_ left: inout Float, _ right: T) {
    left = left / right
}
