//
// Created by Stefano Rodriguez (Bending Spoons) on 02/06/17.
//

public struct FloatEdgeInsets: Equatable {
  public var top: CGFloat
  public var left: CGFloat
  public var bottom: CGFloat
  public var right: CGFloat

  public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
    self.top = top
    self.left = left
    self.bottom = bottom
    self.right = right
  }

  public static func == (lhs: FloatEdgeInsets, rhs: FloatEdgeInsets) -> Bool {
    return
      lhs.top == rhs.top &&
      lhs.left == rhs.left &&
      lhs.bottom == rhs.bottom &&
      lhs.right == rhs.right
  }
}
