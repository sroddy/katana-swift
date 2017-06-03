//
//  Typealiases.swift
//  Katana
//
//  Copyright © 2016-2017 Bending Spoons.
//  Distributed under the MIT License.
//  See the LICENSE file for more information.

public typealias DefaultView = AndroidView

// CoreGraphics
public typealias CGFloat = Double

struct Screen {
  static var retinaScale: CGFloat = 1
}

// FIXME: Temp Stubs until `Dispatch` module is present
struct DispatchQueue {
  static let main = DispatchQueue()

  func async(_ block: () -> ()) {
    block()
  }
}

// FIXME: Temp Stubs until `OperationQueue` is truly working
class OperationQueue {
  enum QualityOfService: Int {
    case userInitiated
  }

  var maxConcurrentOperationCount = 1
  var qualityOfService: QualityOfService = .userInitiated
  var queue: [() -> ()] = []
  var isSuspended = false {
    didSet {
      if !self.isSuspended {
        for block in self.queue {
          block()
        }

        self.queue = []
      }
    }
  }
  func addOperation(_ block: @escaping () -> ()) {
    if self.isSuspended {
      self.queue.append(block)
    } else {
      block()
    }
  }

  init() {}
}
