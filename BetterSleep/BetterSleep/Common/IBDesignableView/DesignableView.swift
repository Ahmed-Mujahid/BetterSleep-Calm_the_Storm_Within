//
//  DesignableView.swift
//  KSC
//
//  Created by developer on 18/03/2021.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadTL:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadTR:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadBL: CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var cornerRadBR: CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var corBRTR: CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var corBLTL:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var padding:CGFloat {
        set {
            self.bounds = self.frame.insetBy(dx: newValue, dy: padding)
        }
        get {
            return self.bounds.origin.x
        }
    }
    
    class func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil, owner: AnyObject) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: owner, options: nil)[0] as? UIView
    }
}

@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5
    @IBInspectable var bottomInset: CGFloat = 1
    @IBInspectable var leftInset: CGFloat = 5
    @IBInspectable var rightInset: CGFloat = 5
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

@IBDesignable
extension UITextField {
    @IBInspectable var placeHolderCustomColor: UIColor? {
        set {
            let attPlaceholderText = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key.foregroundColor: newValue ?? .black])
            self.attributedPlaceholder = attPlaceholderText
        }
        get {
            return nil
        }
    }
}
