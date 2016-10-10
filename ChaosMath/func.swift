//
//  func.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

public func deg (_ rad: Float) -> Float
{
	return 180.0 / Float(M_PI) * rad
}

public func deg (_ rad: Double) -> Double
{
	return 180.0 / M_PI * rad
}


public func rad (_ deg: Float) -> Float
{
	return Float(M_PI) / 180.0 * deg
}


public func rad (_ deg: Double) -> Double
{
	return M_PI / 180.0 * deg
}
