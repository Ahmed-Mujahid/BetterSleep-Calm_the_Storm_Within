//
//  ApiUrl.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
/// URLS for API
/// Following are the Base url for dev and prod
struct APIURLs {
    
    // MARK: - Authenticate:
   
    static let categories = BetterSleepUrl(with: "search?locale=en-US&offset=0&limit=5", "").requestedURL
    
   
}
