//
//  AlertHandler.swift
//  KSC
//
//  Created by developer on 27/04/2021.
//

import Foundation
import UIKit
import PopupDialog

/// This class handles custom alerts
class AlertHandler {
    
    ///  Display default Alert with ok button
    /// - Parameters:
    ///   - message: message to be displayed on popUp
    ///   - inViewController:  name of the controller to be displayed
    class func show(message: String, inViewController: UIViewController) {
        // Creates a Popup dialog
        let popup = PopupDialog(title: "", message: message)
        
        // Cancel button for the popup dialog
        let cancelButton = CancelButton(title: "Ok", action: nil)
        
        // Add buttons to popUp
        popup.addButton(cancelButton)
        
        // Presents a popUp in view controller
        inViewController.present(popup, animated: true, completion: nil)
    }
    
    /// Display default Alert with no title and 1 button with complation handler for cancel button
    /// - Parameters:
    ///   - message: message to be displayed on popUp
    ///   - inViewController:  name of the controller to be displayed
    class func show(message: String, view: UIViewController, completion: @escaping GenericCompletion, cBtnTitle: String) {
        
        // Creates a Popup dialog
        let popup = PopupDialog(title: "", message: message)
        
        // Cancel button for the popup dialog with completaion
        let cancelButton = CancelButton(title: cBtnTitle, action: {
            completion()
        })
        
        // Add buttons to popUp
        popup.addButton(cancelButton)
        
        // Presents a popUp in view controller
        view.present(popup, animated: true, completion: nil)
    }
    
    /// Display default Alert with 2 buttons complation handler for cancel button
    /// - Parameters:
    ///   - message: message to be displayed on popUp
    ///   - view: name of the controller to be displayed
    ///   - completion: completion handler for second button
    ///   - cBtnTitle: first button title
    ///   - secBtnTitle: second button title
    class func show(message: String, view: UIViewController, completion: @escaping GenericCompletion, cBtnTitle: String, secBtnTitle: String) {
        
        // Creates a Popup dialog
        let popup = PopupDialog(title: "", message: message)
        
        // Cancel button for the popup dialog
        let cancelButton = CancelButton(title: cBtnTitle, action: nil)
        
        // second button for the popup dialog with complation handler
        let secBtn = DefaultButton(title: secBtnTitle, action: {
            completion()
        })
        
        // Add buttons to popUp
        popup.addButtons([cancelButton, secBtn])
        
        // Presents a popUp in view controller
        view.present(popup, animated: true, completion: nil)
    }
    
    /// Display default Alert with 2 buttons with complation handler
    /// - Parameters:
    ///   - message: message to be displayed on popUp
    ///   - view: name of the controller to be displayed
    ///   - oneBtnTitle: oneBtnTitle description
    ///   - secBtnTitle: secBtnTitle description
    ///   - completionOne: completionOne
    ///   - completionTwo: completionTwo
    class func show(message: String, view: UIViewController, oneBtnTitle: String, secBtnTitle: String, completionOne: @escaping GenericCompletion, completionTwo: @escaping GenericCompletion) {
        
        // Creates a Popup dialog
        let popup = PopupDialog(title: "", message: message)
        
        //  button for the popup dialog with complation handler
        let oneBtn = DefaultButton(title: oneBtnTitle, action: {
            completionOne()
        })
        
        // button for the popup dialog with complation handler
        let secBtn = DefaultButton(title: secBtnTitle, action: {
            completionTwo()
        })
        
        // Add buttons to popUp
        popup.addButtons([oneBtn, secBtn])
        
        // Presents a popUp in view controller
        view.present(popup, animated: true, completion: nil)
    }
}
