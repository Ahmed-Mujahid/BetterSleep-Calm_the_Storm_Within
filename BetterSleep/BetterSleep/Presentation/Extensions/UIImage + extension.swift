//
//  UIImage + extension.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 10/07/2023.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(_ url: String) {
        print(url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), placeholder: UIImage())
    }
}
