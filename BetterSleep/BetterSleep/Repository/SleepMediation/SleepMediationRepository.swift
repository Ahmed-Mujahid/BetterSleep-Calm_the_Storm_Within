//
//  SleepMediationRepository.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 07/07/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

final class SleepMediationRepository {
    
    func fetchCategory(completion: @escaping GenericModelCompletion<SleepMediation>) {
        
        // Request Intercepter
        let endpoint = EndPointEnum.category
        
        // Check if url is not nil
        guard var requestedURL = endpoint.url else {
            return completion(false, "please Provide URL", nil)
        }
       
        requestedURL += "&term=SleepMediation"
        
        // Network Call
        NetworkManager.shared.request(requestedURL,
                                      endpoint.httpMethod,
                                      Params(),
                                      isAuthReq: endpoint.isAuthRequired,
                                      isJosnEncoded: endpoint.isJSONEncoded,
                                      for: SleepMediation.self) { (success, message, response) in
            if success {
                
                // Completion
                return completion(true, "", response)
                
            } else {
                // Completion
                completion(false,"", nil)
            }
        }
    }
    

}
