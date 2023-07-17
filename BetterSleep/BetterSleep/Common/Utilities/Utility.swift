//
//  Utility.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 09/07/2023.
//

import Foundation
import FittedSheets

struct Utility {
    static func openSheet(_ view: UIViewController) -> SheetViewController {
        let sheetController = SheetViewController(controller: view, sizes: [.percent(0.80)])
        sheetController.cornerRadius = 20
        sheetController.dismissOnOverlayTap = true
        sheetController.dismissOnPull = true
        sheetController.autoAdjustToKeyboard = true
        sheetController.allowPullingPastMaxHeight = false
        sheetController.hasBlurBackground = true
        sheetController.blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        sheetController.animateIn(duration: 0.5, completion: nil)
        return sheetController
    }
    
}
