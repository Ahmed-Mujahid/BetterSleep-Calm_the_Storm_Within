//
//  UIResponder + Extension.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 05/07/2023.
//

import Foundation
import UIKit

extension UIResponder {
  
  func getOwningViewController() -> UIViewController? {
    var nextResponser = self
    while let next = nextResponser.next {
      nextResponser = next
      if let viewController = nextResponser as? UIViewController {
        return viewController
      }
    }
    return nil
  }
}
