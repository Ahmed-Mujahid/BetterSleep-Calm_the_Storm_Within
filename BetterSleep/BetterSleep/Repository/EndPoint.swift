//
//  EndPoint.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import Alamofire

/// Intercerptor for  HTTP requests
enum EndPointEnum {
    // Repository
    case category
   
}

/// defining end point types
extension EndPointEnum: EndPointType {
    
    var isAuthRequired: Bool {
        switch self {
        case .category:
            return false
        default:
            return true
            
        }
    }
    
    var isJSONEncoded: Bool {
        switch self {
        case .category:
            return false
        default:
            return true
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            // Get Method
        case .category:
            return .get
          
        }
    }
    
    var url: String? {
        switch self {
            //  Repository
        case .category:
            return APIURLs.categories
        }
    }
}
