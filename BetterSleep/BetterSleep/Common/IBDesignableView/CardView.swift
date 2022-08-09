//
//  CardView.swift
//  KSC
//
//  Created by developer on 18/03/2021.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.lightGray
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var corners: CGFloat =  Constants.appCornerRadius
    
    override func layoutSubviews() {
        layer.cornerRadius = corners
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: corners)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
