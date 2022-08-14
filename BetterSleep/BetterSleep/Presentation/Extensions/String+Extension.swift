//
//  String+Extension.swift
//  KSC
//
//  Created by developer on 19/05/2021.
//

import Foundation
import UIKit

var defaultLanguage: String!

extension String {
    
    // swiftlint:disable legacy_constructor
    // swiftlint:disable identifier_name
    // swiftlint:enable legacy_constructor
    func isEmail() -> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    // Evaluate Password
    func isPassword() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$").evaluate(with: self)
    }
    
    func isAlphabets() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", ".*[^A-Za-z ].*").evaluate(with: self)
        
    }
    
    func phoneNumberFormate() -> String {
        let phoneNumber = self
        let first3digits = phoneNumber.first(char: 3)
        let last3digits = phoneNumber.last(char: 3)
        let center4digits = phoneNumber.dropLast(3).dropFirst(3)
        return "\(first3digits)  \(center4digits)  \(last3digits)"
    }
    
    // Make Encoded URL
    func encodedStringForUrl() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    // Width of string
    func width(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
    
    // height of string
    func height(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).height
    }
    
    // Remove all white spaces
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func trimWordSpace() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func trimNewLine() -> String {
        return self.replacingOccurrences(of: "\n", with: "")
    }
    
    func newLine() -> String {
        return self.replacingOccurrences(of: "\\n", with: "\n")
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    func trunc(length: Int, trailing: String = "") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
    
    func htmlToAttributedString(modeColor: UIColor? = nil, textfont: UIFont? = UIFont(name: "Robot-Bold", size: 18)) -> NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            let content = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            if let modeColor = modeColor {
                content.addAttributes([NSAttributedString.Key.foregroundColor: modeColor, .font: textfont ?? .systemFont(ofSize: 18)], range: NSMakeRange(0, content.length))
            }
            return content
        }
        catch {
            return nil
        }
    }
    
    var encodeEmoji: String {
        if let encodeStr = NSString(cString: self.cString(using: .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue) {
            return encodeStr as String
        }
        return self
    }
    
    var decodeEmoji: String {
        let data = self.data(using: String.Encoding.utf8)
        let decodedStr = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr {
            return str as String
        }
        return self
    }
    
    // Gets first nth character
    func first(char:Int) -> String {
        return String(self.prefix(char))
    }
    
    // Gets last nth character
    func last(char:Int) -> String {
        return String(self.suffix(char))
    }
    
    // exclude first nth character
    func excludingFirst(char:Int) -> String {
        return String(self.suffix(self.count - char))
    }
    
    // exclude last nth character
    func excludingLast(char:Int) -> String {
        return String(self.prefix(self.count - char))
    }
    
    func toASCII() -> String {
        if let utfData = self.data(using: .isoLatin1) {
            if let utf = String(data: utfData, encoding: .utf8) {
                return utf
            }
        }
        return self
    }
}

extension NSAttributedString {
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.width)
    }
}

extension NSAttributedString {
    convenience init(base: String, keyWords: [String], foregroundColor: UIColor, font: UIFont, highlightForeground: UIColor, highlighBackground: UIColor) {
        let baseAttributed = NSMutableAttributedString(string: base, attributes: [NSAttributedString.Key.font: font,
                                                                                  NSAttributedString.Key.foregroundColor: foregroundColor])
        let range = NSRange(location: 0, length: base.utf16.count)
        for word in keyWords {
            guard let regex = try? NSRegularExpression(pattern: word, options: .caseInsensitive) else {
                continue
            }
            regex
                .matches(in: base, options: .withTransparentBounds, range: range)
                .forEach { baseAttributed
                    .addAttributes([NSAttributedString.Key.backgroundColor: highlighBackground,
                                    NSAttributedString.Key.foregroundColor: highlightForeground],
                                   range: $0.range) }
        }
        self.init(attributedString: baseAttributed)
    }
}
