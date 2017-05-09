//
//  Double.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

extension Double : ArithmeticFloatType {
    
    public init<T: ArithmeticScalarType>(_ value: T) {
        self.init(value.toDouble())
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
        return self
    }
    
    
    public func sqrt() -> Double {
        return Darwin.sqrt(self)
    }
    
    
    public func sin () -> Double {
        return Darwin.sin(self)
    }
    
    
    public func asin () -> Double {
        return Darwin.asin(self)
    }
    
    
    public func cos () -> Double {
        return Darwin.cos(self)
    }
    
    
    public func acos () -> Double {
        return Darwin.acos(self)
    }
    
    
    public func tan () -> Double {
        return Darwin.tan(self)
    }
    
    
    public func atan () -> Double {
        return Darwin.atan(self)
    }
}


public func +<T: ArithmeticIntType> (_ left: Double, _ right: T) -> Double {
    return left + Double(right.toFloat())
}


public func +<T: ArithmeticIntType> (_ left: T, _ right: Double) -> Double {
    return right + left
}


public func -<T: ArithmeticIntType> (_ left: Double, _ right: T) -> Double {
    return left - Double(right.toFloat())
}


public func -<T: ArithmeticIntType> (_ left: T, _ right: Double) -> Double {
    return -right + left
}


public func *<T: ArithmeticIntType> (_ left: Double, _ right: T) -> Double {
    return left * Double(right.toFloat())
}


public func *<T: ArithmeticIntType> (_ left: T, _ right: Double) -> Double {
    return right * left
}


public func /<T: ArithmeticIntType> (_ left: Double, _ right: T) -> Double {
    return left / Double(right.toFloat())
}


public func /<T: ArithmeticIntType> (_ left: T, _ right: Double) -> Double {
    return Double(left.toFloat()) / right
}


public func +=<T: ArithmeticIntType> (_ left: inout Double, _ right: T) {
    left = left + right
}


public func -=<T: ArithmeticIntType> (_ left: inout Double, _ right: T) {
    left = left - right
}


public func *=<T: ArithmeticIntType> (_ left: inout Double, _ right: T) {
    left = left * right
}


public func /=<T: ArithmeticIntType> (_ left: inout Double, _ right: T) {
    left = left / right
}
