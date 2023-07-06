//
//  Dictionary + Extension.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation

extension Dictionary {
    var toJson: Data? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil
        }
        return theJSONData
    }
}
