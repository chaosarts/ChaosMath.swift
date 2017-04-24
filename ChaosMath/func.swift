//
//  func.swift
//  ChaosMath
//
//  Created by Fu Lam Diep on 07/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation

/// Constant float radian to degree conversion
private let f_rad2deg : Float = 180.0 / Float(Double.pi)

/// Constant float degree to radian conversion
private let f_deg2rad : Float = Float(Double.pi) / 180.0

/// Constant double radian to degree conversion
private let d_rad2deg : Double = 180.0 / Double.pi

/// Constant double degree to radian conversion
private let d_deg2rad : Double = Double.pi / 180.0


/// Converts a float radian value to a float degree value
/// - parameter rad: The radian value to convert
/// - returns: The corresponding degree value 
public func deg (_ rad: Float) -> Float {
	return f_rad2deg * rad
}


/// Converts a float degree value to a float radian value
/// - parameter deg: The radian degree to convert
/// - returns: The corresponding radian value
public func deg (_ rad: Double) -> Double {
	return d_rad2deg * rad
}


/// Converts a double radian value to a double degree value
/// - parameter rad: The radian value to convert
/// - returns: The corresponding degree value
public func rad (_ deg: Float) -> Float {
	return f_deg2rad * deg
}


/// Converts a double degree value to a double radian value
/// - parameter deg: The radian degree to convert
/// - returns: The corresponding radian value
public func rad (_ deg: Double) -> Double {
	return d_deg2rad * deg
}
