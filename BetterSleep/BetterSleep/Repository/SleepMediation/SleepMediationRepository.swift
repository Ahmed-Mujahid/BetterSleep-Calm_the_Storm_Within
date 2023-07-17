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
    
    func fetchSong(by title: String, completion: @escaping GenericModelCompletion<[HomeItem]>) {
        print("Repository: \(title)")
        // Request Intercepter
        let endpoint = EndPointEnum.category
        
        // Check if url is not nil
        guard var requestedURL = endpoint.url else {
            return completion(false, "please Provide URL", nil)
        }
        
        requestedURL += "&term=\(title.replacingOccurrences(of: " ", with: ""))"
        
        // Network Call
        NetworkManager.shared.request(requestedURL,
                                      endpoint.httpMethod,
                                      Params(),
                                      isAuthReq: endpoint.isAuthRequired,
                                      isJosnEncoded: endpoint.isJSONEncoded,
                                      for: SleepMediation.self) { (success, message, response) in
            if success {
               var item = [HomeItem]()
                if let hits = response?.tracks?.hits {
                    for hit in hits {
                        let title = (hit.track?.title ?? "") + "-" + (hit.track?.subtitle ?? "")
                        let icon = hit.track?.images?.background
                        let url = hit.track?.hub?.actions?.last?.uri
                        item.append(HomeItem(title: title,
                                             icon: icon ?? "",
                                             url: url ?? ""))
                    }
                }
                // Completion
                return completion(true, "", item)
                
            } else {
                // Completion
                completion(false,"", nil)
            }
        }
    }
    
    func fetchMusic(for url: String?, completion: @escaping GenericModelCompletion<Any>) {
     
        
        // Check if url is not nil
        guard var requestedURL = url else {
            return completion(false, "PLEASE_PROVIDE_URL", nil)
        }
      
        
        // Network Request
        NetworkManager.shared.download(requestedURL) { success, response in
            if success {
                
                // Completion
                completion(true, "", response[Constants.docPath].stringValue)
                
            } else {
                // Completion
                completion(false, response["MESSAGE"].stringValue, nil)
            }
        }
      
    }
    

}
