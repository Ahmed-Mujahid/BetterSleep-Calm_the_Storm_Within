//
//  BsTabViewController.swift
//  BetterSleep
//
//  Created by developer on 20/08/2022.
//

import UIKit

enum TabBar: Int {
    case HOME
    case SLEEP
    case STATITICS
}

class BsTabViewController: UITabBarController {
    
    // MARK: - IBOutlets
    
    // MARK: - Containers
    
    // MARK: - Instances
    
    // MARK: - Variables
    var shadowView = CardView()
    
    // MARK: - Constants
    let cornerRadius = 50
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Making top right and left corners round
        setCorners()
        
        // Adding Shadow View
        addShadow()
        
        // colors for selected and unselected tabs
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = BSColors.BS_Purple
     
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        
        // Configure call back
        
    }
   
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    func addShadow() {
        shadowView.frame = CGRect(x: self.tabBar.frame.minX,
                                   y: self.tabBar.frame.minY - self.tabBar.frame.height + 65,
                                   width: self.tabBar.frame.width + 10,
                                   height:  self.tabBar.frame.height)
        
        shadowView.backgroundColor = .clear
        shadowView.shadowColor = UIColor.black
        shadowView.corners = CGFloat(cornerRadius)
        view.addSubview(shadowView)
        view.bringSubviewToFront(tabBar)
    }
    
    func setCorners() {
        let path = UIBezierPath(roundedRect:tabBar.bounds,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        tabBar.layer.mask = maskLayer
    }
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
