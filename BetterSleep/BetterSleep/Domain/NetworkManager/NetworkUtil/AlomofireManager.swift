//
//  AlomofireManager.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import Alamofire

struct AlamofireManager {

    // MARK: - logger
    let monitors = [AlamofireLogger()] as [EventMonitor]
    
    // MARK: - session
    var session = Session()
    
    init() {
        
        // URL Session Configuration
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        // Response Cacher
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        
        // Return Session
        session = Session(
            configuration: configuration,
            cachedResponseHandler: responseCacher,
            eventMonitors: monitors
        )
    }
}
