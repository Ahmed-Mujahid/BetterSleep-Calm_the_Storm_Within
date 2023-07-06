//
//  EndPointType.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import Alamofire

protocol EndPointType {
    var url: String? { get }
    var httpMethod: HTTPMethod { get }
    var isAuthRequired: Bool { get }
    var isJSONEncoded: Bool { get }
}
