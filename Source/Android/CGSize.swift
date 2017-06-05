//
//  Size.swift
//  Silica
//
//  Created by Alsey Coleman Miller on 5/10/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A structure that contains width and height values.
public struct CGSize: Equatable {

  public var width: Double

  public var height: Double

  public init(width: Double = 0, height: Double = 0) {

    self.width = width
    self.height = height
  }
}

// MARK: - Equatable

public func == (lhs: CGSize, rhs: CGSize) -> Bool {

  return lhs.width == rhs.width && lhs.height == rhs.height
}
