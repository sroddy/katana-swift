//
//  Point.swift
//  Silica
//
//  Created by Alsey Coleman Miller on 5/10/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A structure that contains a point in a two-dimensional coordinate system.
public struct CGPoint: Equatable {

  public var x: Double

  public var y: Double

  public init(x: Double = 0, y: Double = 0) {

    self.x = x
    self.y = y
  }
}

public func == (lhs: CGPoint, rhs: CGPoint) -> Bool {

  return lhs.x == rhs.x && lhs.y == rhs.y
}
