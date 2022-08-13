//
//  Storyboards.swift
//  KSC TV
//
//  Created by devadmin on 25/08/2021.
//

import Foundation


// MARK: - Enum for Storyboard Reference
enum StoryboardReference: String {
    case Main
    case Authentication
}

// MARK: - View Controller Reference
enum ViewControllerReference: String {
    
    // MARK: - Main
    /// Main Stroyboard contain the following views
    case HomeViewController
    
    // MARK: - Authentication
    /// Authentication Stroyboard contain the following views
    case WelcomeViewController
}
