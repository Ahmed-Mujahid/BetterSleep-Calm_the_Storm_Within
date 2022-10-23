//
//  UIView+Extension.swift
//  KSC
//
//  Created by developer on 18/03/2021.
//

import UIKit

enum ViewBorder: String {
    case left, right, top, bottom
}

extension UIView {
    
    func addBorder(vBorder: ViewBorder, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = vBorder.rawValue
        switch vBorder {
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            
        case .right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        }
        self.layer.addSublayer(border)
    }
    
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func applyNavBarConstraints(size: (width: CGFloat, height: CGFloat)) {
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: size.width)
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: size.height)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    func updateBorder(color: UIColor? = .clear) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = 1
    }
    
    func updateBorder(color: UIColor? = .clear, border: CGFloat = 1) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = border
    }
    
    func updateBorderOnLeft(color: UIColor, width: CGFloat) {
        
        // Left
        let leftborder = CALayer()
        leftborder.backgroundColor = color.cgColor
        leftborder.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(leftborder)
        
        // Top
        let topborder = CALayer()
        topborder.backgroundColor = color.cgColor
        topborder.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(topborder)
        
        // Bottom
        let bottemborder = CALayer()
        bottemborder.backgroundColor = color.cgColor
        bottemborder.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(bottemborder)
    }
    
    func round() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
    func round(_ round: CGFloat) {
        self.layer.cornerRadius = round
        self.layer.masksToBounds = true
    }
    
    func roundTop(radius: CGFloat) {
        let topLeft: UIRectCorner = .topLeft
        let topRight: UIRectCorner = .topRight
        round([topRight, topLeft], radius: radius)
       
    }
    
    func roundBottem(radius: CGFloat) {
        let bottomLeft: UIRectCorner = .bottomLeft
        let bottomRight: UIRectCorner = .bottomRight
        round([bottomLeft, bottomRight], radius: radius)
    }
    
    func round(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    func applyEfect(_ isBackGroundClear: Bool = false) {
        if isBackGroundClear {
            let previousColor = UIColor.white
            self.backgroundColor = previousColor.withAlphaComponent(0.5)
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = .clear
            }
        } else {
            let previousColor = self.backgroundColor
            self.backgroundColor = previousColor?.withAlphaComponent(0.5)
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = previousColor
            }
        }
    }
    
    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func shake(duration: CFTimeInterval) {
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        translation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0]
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0].map {
            (degrees: Double) -> Double in
            let radians: Double = (.pi * degrees) / 180.0
            return radians
        }
        
        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = duration
        self.layer.add(shakeGroup, forKey: "shakeIt")
    }
    
    func dropShadow(scale: Bool = true) {
           layer.masksToBounds = false
           layer.shadowColor = UIColor.black.cgColor
           layer.shadowOpacity = 1
           layer.shadowOffset = .zero
           layer.shadowRadius = 1
           layer.shouldRasterize = true
           layer.rasterizationScale = scale ? UIScreen.main.scale : 1
       }
}
