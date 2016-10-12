//
//  func.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

private let f_rad2deg : Float = 180.0 / Float(M_PI)
private let f_deg2rad : Float = Float(M_PI) / 180.0

private let d_rad2deg : Double = 180.0 / M_PI
private let d_deg2rad : Double = M_PI / 180.0

/// Converts a float radian value to a float degree value
///
public func deg (_ rad: Float) -> Float {
	return f_rad2deg * rad
}

public func deg (_ rad: Double) -> Double {
	return d_rad2deg * rad
}


public func rad (_ deg: Float) -> Float {
	return f_deg2rad * deg
}


public func rad (_ deg: Double) -> Double {
	return d_deg2rad * deg
}
