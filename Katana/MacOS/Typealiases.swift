//
//  DefaultView.swift
//  Katana
//
//  Copyright © 2016 Bending Spoons.
//  Distributed under the MIT License.
//  See the LICENSE file for more information.

import AppKit
import CoreGraphics

public typealias DefaultView = NSViewCustom
public typealias FloatEdgeInsets = Foundation.EdgeInsets
public typealias Screen = NSScreen

// Coregraphics
public typealias CGFloat = CoreGraphics.CGFloat
public typealias CGRect = CoreGraphics.CGRect
public typealias CGSize = CoreGraphics.CGSize
public typealias CGPoint = CoreGraphics.CGPoint

extension NSScreen {
  static var retinaScale: CGFloat {
    return NSScreen.main()!.backingScaleFactor
  }
}
