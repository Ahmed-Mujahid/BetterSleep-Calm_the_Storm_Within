//
//  RequestedUrl.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation


/// This class is used to set url endpoints
class BetterSleepUrl {
    
    // MARK: - Public variables
    var requestedURL: String?
    
    // MARK: - Required init
    required init(with URI: String, _ version: String) {
        let configurators = AppConfiguration()
        requestedURL = configurators.apiBaseURL + version + URI
    }
}
