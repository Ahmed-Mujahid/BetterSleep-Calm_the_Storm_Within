//
//  BetterSleepManager.swift
//  BetterSleep
//
//  Created by developer on 02/08/2022.
//

import Foundation
import UIKit


enum Build {
    case Development
    case Production
}

enum IPHONESIZE: String {
    case Iphone12
    case Iphone10
    case other
    case none
}

class BetterSleepManager: NSObject {
    
    // MARK: - Shared instance
    static let shared = BetterSleepManager()
    
    // MARK: - Shared Variables
    // APP Delegate
    let appDelegate: AppDelegate!
    
    // App Variables
    var buildVarient: Build = .Development
   
    
    // MARK: - Init
    override init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    // MARK: - Shared methods
    func getStoryboardReference(storyboard: StoryboardReference) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }
    
    func navigateView(viewRef: ViewControllerReference, storyboard: StoryboardReference) -> UIViewController {
        let view = getStoryboardReference(storyboard: storyboard).instantiateViewController(withIdentifier: viewRef.rawValue)
        return view
    }
    
    func setRoot(_ view: UIViewController) {
        if let scene = UIApplication.shared.connectedScenes.first {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
            self.appDelegate.window = window
            window.windowScene = windowScene
            window.rootViewController = view
            window.makeKeyAndVisible()
        }
    }
}
