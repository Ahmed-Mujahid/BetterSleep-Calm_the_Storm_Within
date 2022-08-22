//
//  BsTabViewController.swift
//  BetterSleep
//
//  Created by developer on 20/08/2022.
//

import UIKit

enum TabBar {
    case HOME
    case SLEEP
    case STATITICS
}

class BsTabViewController: UITabBarController {
    
    // MARK: - IBOutlets
    
    // MARK: - Containers
    
    // MARK: - Instances
    
    // MARK: - Variables
    
    // MARK: - Constants
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 10
    var shadowColor: UIColor? = UIColor.lightGray
    var shadowOpacity: Float = 0.5
    var corners: CGFloat =  Constants.appCornerRadius
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tabBar.round(CGFloat(Constants.tabBarHeight/2))
        tabBar.standardAppearance.shadowColor = .black
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        
        // Configure call back
        
    }
   
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    
}
// MARK: - View Extensions
class CustomTabBar : UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = CGFloat(Constants.tabBarHeight)
        return sizeThatFits
    }
}
