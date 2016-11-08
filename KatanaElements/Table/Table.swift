//
//  Table.swift
//  Katana
//
//  Created by Mauro Bolis on 31/10/2016.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import Foundation
import UIKit
import Katana

public struct TableProps: NodeDescriptionProps, Keyable {
  public var frame = CGRect.zero
  public var key: String?
  
  public var delegate: TableDelegate = EmptyTableDelegate()
  public var backgroundColor = UIColor.white
  public var cornerRadius: CGFloat = 0.0
  public var borderWidth: CGFloat = 0.0
  public var borderColor = UIColor.clear
  public var clipsToBounds = true
  
  public init() {}
  
  public static func == (lhs: TableProps, rhs: TableProps) -> Bool {
    return
      lhs.frame == rhs.frame &&
      lhs.key == rhs.key &&
      lhs.backgroundColor == rhs.backgroundColor &&
      lhs.cornerRadius == rhs.cornerRadius &&
      lhs.borderWidth == rhs.borderWidth &&
      lhs.borderColor == rhs.borderColor &&
      lhs.clipsToBounds == rhs.clipsToBounds &&
      lhs.delegate.isEqual(to: rhs.delegate)
  }
}

public struct Table: NodeDescription {
  public typealias NativeView = NativeTable
  
  public var props: TableProps
  
  public init(props: TableProps) {
    self.props = props
  }
  
  public static func applyPropsToNativeView(props: TableProps,
                                            state: EmptyState,
                                            view: NativeTable,
                                            update: @escaping (EmptyState)->(),
                                            node: AnyNode) {
    
    view.frame = props.frame
    view.backgroundColor = props.backgroundColor
    view.layer.cornerRadius = props.cornerRadius
    view.layer.borderWidth = props.borderWidth
    view.layer.borderColor = props.borderColor.cgColor
    view.clipsToBounds = props.clipsToBounds
    view.update(withparent: node, delegate: props.delegate)
  }
  
  
  public static func childrenDescriptions(props: TableProps,
                            state: EmptyState,
                            update: @escaping (EmptyState)->(),
                            dispatch: @escaping StoreDispatch) -> [AnyNodeDescription] {
    return []
  }
}