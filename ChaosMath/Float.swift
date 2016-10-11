//
//  Float.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

extension Float : ArithmeticFloatType {
    
    public init<T: ArithmeticIntType> (_ value: T) {
        self.init(value.toFloat())
    }
    
    
    public func toFloat() -> Float {
        return self
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
