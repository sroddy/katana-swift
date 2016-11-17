//
//  NativeTable.swift
//  Katana
//
//  Copyright © 2016 Bending Spoons.
//  Distributed under the MIT License.
//  See the LICENSE file for more information.

import Foundation
import UIKit
import Katana

private let cellIdentifier = "KATANA_CELLIDENTIFIER"

// TODO: I don't want NativeTable to be an NSObject, so move the DataSource and Delegate in a separate NSObject class
public class NativeTable: NSObject, DrawableContainer {
  private(set) weak var parent: AnyNode?
  
  private var tableView: UITableView = UITableView()
  
  fileprivate var cellDescriptions: [AnyNodeDescription] = []
  
  required public override init() {
    frame = .zero
    alpha = 1.0
    tag = 0
    tableView.register(NativeTableWrapperCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.tableFooterView = UIView()
    tableView.separatorStyle = .none
    
    super.init()
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  public static func make() -> Self {
    return self.init()
  }
  
  

  public var frame: CGRect {
    didSet {
      tableView.frame = frame
    }
  }
  
  public var alpha: CGFloat {
    didSet {
      tableView.alpha = alpha
    }
  }
  
  public var tag: Int {
    didSet {
      return
    }
  }
  
  public func removeAllChildren() {
    return
  }
  
  internal let VIEWTAG = 999987
  
  @discardableResult public func addChild(_ child: () -> DrawableContainer) -> DrawableContainer {
    if #available(iOS 10.0, *) {
      dispatchPrecondition(condition: .onQueue(DispatchQueue.main))
      
    } else {
      assert(Thread.isMainThread)
    }
    
    
    
    let child = child()
    child.tag = VIEWTAG
    
    tableView.reloadData()
    
    return child
  }
  
  public func addToParent(parent: DrawableContainer) {
    if let parent = parent as? UIView {
      parent.addSubview(tableView)
    }
  }
  
  
  public func update(with updateView: (DrawableContainer)->()) {
    if #available(iOS 10.0, *) {
      dispatchPrecondition(condition: .onQueue(DispatchQueue.main))
      
    } else {
      assert(Thread.isMainThread)
    }
    
    updateView(self)
  }
  
  public func children () -> [DrawableContainerChild] {
    return []
  }
  
  public func bringChildToFront(_ child: DrawableContainerChild) {
    return
  }
  
  public func removeChild(_ child: DrawableContainerChild) {
    return
  }
}


extension NativeTable: TableDelegate {
  public func numberOfSections() -> Int {
    return 1
  }
  
  public func numberOfRows(forSection section: Int) -> Int {
    return self.cellDescriptions.count
  }
  
  public func cellDescription(forRowAt indexPath: IndexPath) -> AnyNodeDescription {
    return self.cellDescriptions[indexPath.row]
  }
  
  public func height(forRowAt indexPath: IndexPath) -> Value {
    return .scalable(100)
  }
  
  public func isEqual(to anotherDelegate: TableDelegate) -> Bool {
    return false
  }
}
  
/*
  override public init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
   
    self.register(NativeTableWrapperCell.self, forCellReuseIdentifier: cellIdentifier)
    self.tableFooterView = UIView()
    self.separatorStyle = .none
    
    self.delegate = self
    self.dataSource = self
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(withparent parent: AnyNode, delegate: TableDelegate) {
    self.parent = parent
    
    if let currentDelegate = self.katanaDelegate, currentDelegate.isEqual(to: delegate) {
      return
    }
    
    self.katanaDelegate = delegate
    self.reloadData()
  }
}
*/

extension NativeTable: UITableViewDataSource {
  public func numberOfSections(in tableView: UITableView) -> Int {
    return self.numberOfSections()
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.numberOfRows(forSection: section)
  }
  
  @objc(tableView:cellForRowAtIndexPath:)
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NativeTableWrapperCell
    
    if let parent = self.parent {
      let description = self.cellDescription(forRowAt: indexPath)
      cell.update(withparent: parent, description: description)
    }
    
    return cell
  }
  
  @objc(tableView:heightForRowAtIndexPath:)
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if let node = self.parent {
      let value = self.height(forRowAt: indexPath)
      return value.scale(by: node.plasticMultipler)
    }
    
    return 0
  }
}


extension NativeTable: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! NativeTableWrapperCell
    cell.didTap(atIndexPath: indexPath)
  }
}
