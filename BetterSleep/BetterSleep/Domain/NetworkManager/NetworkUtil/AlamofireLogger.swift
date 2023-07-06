//
//  AlamofireLogger.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import Alamofire

struct AlamofireLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "BaseLogger")
    
    func requestDidResume(_ request: Request) {
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint(response)
    }
}
