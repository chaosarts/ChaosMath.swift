//
//  vec.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 09/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public protocol VectorType : ExpressibleByArrayLiteral, Equatable, ExpressibleByIntegerLiteral {
    static var dim : Int {get}
}
