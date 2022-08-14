//
//  UIButton+Extesnion.swift
//  KSC
//
//  Created by developer on 18/03/2021.
//

import Foundation
import UIKit
import Kingfisher
import RxSwift

extension UIButton {
    
    func underlined(_ title: String, _ color: UIColor = .white, _ font: CGFloat = 12) {
        let underlineAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "American Captain", size: font) ?? UIFont.systemFont(ofSize: font),
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: title, attributes: underlineAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
    }
    
    func underlined(_ title: String, boldString: String, isBold: Bool = false, _ color: UIColor = .white, _ fontSize: CGFloat = 14) {
        let font = isBold ? UIFont(name: "American Captain", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: .bold) : UIFont(name: "American Captain", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        let underlineAttributes: [NSAttributedString.Key: Any] = [ .font: font, .foregroundColor: color, .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "American Captain", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color]
        let underline = NSMutableAttributedString(string: boldString, attributes: underlineAttributes)
        let simple = NSMutableAttributedString(string: title, attributes: attributes)
        
        // Combine
        let combination = NSMutableAttributedString()
        combination.append(simple)
        combination.append(underline)
        
        // Set title
        self.setAttributedTitle(combination, for: .normal)
    }

    func applyFont(with fontFaily: String, _ point: CGFloat) {
        self.titleLabel?.font = UIFont(name: fontFaily, size: point)
    }
    
    func adjustFont(_ title: String, _ title2: String, _ color1: UIColor = .white, _ color2: UIColor = BSColors.BS_Purple, _ fontSize: CGFloat = 12) {
        
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Roboto-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color1]
        let title2attributes: [NSAttributedString.Key: Any] = [ .font: UIFont(name: "Roboto-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color2]
    
        let title1Text = NSMutableAttributedString(string: title, attributes: titleAttributes)
        let title2text = NSMutableAttributedString(string: title2, attributes: title2attributes)
        
        // Combine
        let combination = NSMutableAttributedString()
        combination.append(title1Text)
        combination.append(title2text)
        
        // Set title
        self.setAttributedTitle(combination, for: .normal)
    }
    
    func handleModes(_ color: UIColor) {
        self.titleLabel?.textColor = color
        self.borderColor = color
    }
    
    func setImage(_ url: String) {
        self.imageView?.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), for: .normal)
    }
    
    func blinkEfect(_ isBackGroundClear: Bool = false) {
        if isBackGroundClear {
            let previousColor = self.currentTitleColor
            self.setTitleColor(previousColor.withAlphaComponent(0.5), for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = .clear
            }
        } else {
            let previousColor = self.backgroundColor
            self.setTitleColor(previousColor?.withAlphaComponent(0.5), for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor = previousColor
            }
        }
    }
}
extension Reactive where Base: UIButton {

    /// Reactive wrapper for `setAttributedTitle(_:controlState:)`
    public func bsAttributedTitle(sepratedby seprator: String, _ color1: UIColor, _ color2: UIColor, _ fontSize: CGFloat = 12) -> Binder<NSAttributedString?> {
        
        return Binder(self.base) { button, bsAttributedTitle -> Void in
            let titleAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Roboto-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color1]
            let title2attributes: [NSAttributedString.Key: Any] = [ .font: UIFont(name: "Roboto-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color2]
        
            guard let titles = bsAttributedTitle?.string.components(separatedBy: seprator) else { return }
            
            let title1Text = NSMutableAttributedString(string: titles[0], attributes: titleAttributes)
            let title2text = NSMutableAttributedString(string: titles[1], attributes: title2attributes)
            
            // Combine
            let combination = NSMutableAttributedString()
            combination.append(title1Text)
            combination.append(title2text)
            
            // Set title
            button.setAttributedTitle(combination, for: .normal)
        }
    }

}
