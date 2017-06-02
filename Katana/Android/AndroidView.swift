//
//  AndroidView.swift
//  Katana
//
//  Copyright © 2016-2017 Bending Spoons.
//  Distributed under the MIT License.
//  See the LICENSE file for more information.

internal let VIEWTAG = 999987

/// An extension of
class AndroidView: PlatformNativeView {
  /// The frame of the native view
  public var frame: CGRect

  /// The alpha of the native view
  public var alpha: CGFloat

  /// An unique tag value related to the native view
  public var tagValue: Int

  /**
   Creates a new instance of the platform native view

   - returns: a valid instance of the platform native view
  */
  public static func make() -> Self {
    return self.init()
  }

  /**
   Removes all the children from the container

   - warning: this method should be invoked in the main queue
   */
  public func removeAllChildren() {

  }

  /**
   Adds a child to the container

   - parameter child: a closure that returns the DrawableContainer to add to the container
   - returns: the container that holds the child

   - warning: this method should be invoked in the main queue
   */
  @discardableResult func addChild(_ child: () -> PlatformNativeView) -> PlatformNativeView {
    let child = child()
    child.tagValue = VIEWTAG

    child.addToParent(parent: self)

    return child
  }

  /**
   Adds the platform native view to a parent

   - parameter parent: the parent
  */
  public func addToParent(parent: PlatformNativeView) {

  }

  /**
   Updates the description

   - parameter updateView: a closure that takes as input the PlatformNativeView represented by the container and
   updates it

   - warning: this method should be invoked in the main queue
   */
  public func update(with updateView: (PlatformNativeView)->()) {

  }

  /// Returns the children of the container
  public func children () -> [PlatformNativeView] {
    return []
  }

  /**
   Moves to the front a child

   - parameter child: the child to move to the front
   */
  public func bringChildToFront(_ child: PlatformNativeView) {

  }

  /**
   Removes a child

   - parameter child: the child to remove
   */
  public func removeChild(_ child: PlatformNativeView) {

  }

  /**
   Animates UI changes performed in a block with the animation specified by the AnimationType
   - parameter type: the type of the animation
   - parameter block: a block that contains the updates to the UI to animate
   - parameter completion: a block that is called when the animation completes
   */
  static func animate(type: AnimationType, _ block: @escaping ()->(), completion: (() -> ())?) {
    block()
    completion?()
  }
}
