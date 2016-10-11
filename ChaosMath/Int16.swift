//
//  Int.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

extension Int16 : ArithmeticIntType {
    
    public func toFloat() -> Float {
        return Float(self)
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
