//
//  Typealiases.swift
//  Katana
//
//  Copyright © 2016 Bending Spoons.
//  Distributed under the MIT License.
//  See the LICENSE file for more information.

import UIKit
import CoreGraphics

public typealias DefaultView = UIView
public typealias FloatEdgeInsets = UIEdgeInsets
public typealias Screen = UIScreen

// CoreGraphics
public typealias CGFloat = CoreGraphics.CGFloat
public typealias CGRect = CoreGraphics.CGRect
public typealias CGSize = CoreGraphics.CGSize
public typealias CGPoint = CoreGraphics.CGPoint

extension UIScreen {
  static var retinaScale: CGFloat {
    return UIScreen.main.scale
  }
}
