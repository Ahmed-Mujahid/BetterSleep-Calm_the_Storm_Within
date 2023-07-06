//
//  AppConfiguration.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation

/// Configuration for base url and image url
final class AppConfiguration {
    
    lazy var apiBaseURL: String = {
        if BetterSleepManager.shared.buildVarient == .Development {
            guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
                fatalError("ApiBaseURL must not be empty in plist")
            }
            return apiBaseURL
        } else {
            guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiProductionURL") as? String else {
                fatalError("ApiBaseURL must not be empty in plist")
            }
            return apiBaseURL
        }
    }()
    
    lazy var imagesBaseURL: String = {
        guard let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return imageBaseURL
    }()
   
}
