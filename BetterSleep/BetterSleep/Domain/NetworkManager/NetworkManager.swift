//
//  NetworkManager.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
import UIKit
import SystemConfiguration
import Alamofire
import SwiftyJSON
import MBProgressHUD

struct File {
    var data: Data?
    var url: URL?
    var name: String?
}

class NetworkManager: NSObject {
    
    // MARK: - Shared instance
    static let shared = NetworkManager()
    
    // MARK: - Shared Variables
    var headers: HTTPHeaders = [Headers.contentType:  Headers.FormUrlEncoded]
    let retryLimit = 3
    
    // MARK: - Constants
    private let alamofireManager = AlamofireManager()
    
    // MARK: - Shared methods
    private func addAuthHeaders(_ isAuth: Bool = false, _ isJson: Bool = false) -> (Bool, HTTPHeaders) {
        var header: HTTPHeaders = [:]
        if isAuth {
            header[Headers.auth] = AppDefaults.shared.getToken()
        }
        header[Headers.contentType] =  Headers.JsonEncoded
        header["X-RapidAPI-Key"] = "8cb98b17dbmsh110b20afa58d774p13e07cjsnfc8c07fb705b"
        header["X-RapidAPI-Host"] = "shazam.p.rapidapi.com"
        return (true, header)
    }
    
    private func checkAPIStatus(_ response: Int) -> Bool {
        if response == 200  || response == 202 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Request for General Apis
    
    func request<T: Codable>(_ url: String,
                             _ method: HTTPMethod = .get,
                             _ params: Params,
                             isAuthReq: Bool = false,
                             isJosnEncoded: Bool = false,
                             for type: T.Type,
                             completion: @escaping GenericModelCompletion<T>) {
        
        // check if internet is connected
        MonitorNetwork.shared.Connection(observe: true) { connection in
            
            if connection ?? false {
                
                if isJosnEncoded {
                    
                    // Check URL
                    guard let requestedURL = URL(string: url) else {
                        return
                    }

                    // URL Request
                    var urlRequest = URLRequest(url: requestedURL)
                    urlRequest.httpBody = params.toJson
                    urlRequest.httpMethod = method.rawValue

                    // Headers
                    if isAuthReq {
                        urlRequest.addValue(AppDefaults.shared.getToken(), forHTTPHeaderField:  Headers.auth)
                    }

                    urlRequest.addValue(Headers.JsonEncoded, forHTTPHeaderField:  Headers.contentType)
                    urlRequest.addValue(Headers.versionValue, forHTTPHeaderField:  Headers.version)

                    // Alamofire request
                    self.alamofireManager.session.request(urlRequest).validate(statusCode: 200..<600).responseDecodable(of: type) { (response) in
                        self.manageResponses(for: response) { success, message, result  in
                            completion(success, message, result)
                        }
                    }
                } else {
                    
                    self.alamofireManager
                        .session
                        .request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: self.addAuthHeaders(isAuthReq).1)
                        .validate(statusCode: 200..<600)
                        .responseDecodable(of: type) { response in
                            self.manageResponses(for: response) { success, message, result  in
                                completion(success, message, result)
                            }
                        }
                }
            } else {
                // if internet is not available
                let params = ["message": "INTERNET_ERRORMESSAGE"]
                completion(false, "INTERNET_ERRORMESSAGE", nil)
                
            }
        }
    }
    
    func download(_ url: String, _ method: HTTPMethod = .get, _ params: Params = Params(), isAuthReq: Bool = false, completion: @escaping CompletionNetwork) {
        
//        if !Reachability.shared.isReachable {
//            let params = ["message": "INTERNET_ERRORMESSAGE"]
//            completion(false, "INTERNET_ERRORMESSAGE", nil)
//        }
//
        // print(params.toJsonString)
        
        // Download Destination
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            print(documentsURL)
            return (documentsURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        alamofireManager.session.download(url, method: method, encoding: JSONEncoding.default, to: destination)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("progress: \(progress)")
                DispatchQueue.main.async {
                    let Progress = [Constants.downloadProgress: progress.fractionCompleted]
                    NotificationCenter.default.post(name: .downloadProgress, object: nil, userInfo: Progress)
                }
            }.response { response in
                if response.error == nil, let docPath = response.fileURL {
                    let josn = JSON([Constants.docPath: docPath.path])
                    completion(true, josn)
                } else {
                    if let message = response.error?.localizedDescription {
                        print(message)
                        let josn = JSON(["MESSAGE": message])
                        completion(false, josn)
                    }
                }
            }
    }
    private func manageResponses(_ response: AFDataResponse<Any>, completion: @escaping CompletionNetwork) {
        print("Status Code: \(response.response?.statusCode ?? 200)")
        
        switch response.result {
        case .failure(let error):
            
            // Failure completion block
            
            let errorMessage = error.localizedDescription
            
            print(errorMessage)
            
            var params: Params = [:]
            
            if errorMessage == "INTERNET_LOCALISED_ERRORMESSAGE" {
                params = ["message": "INTERNET_ERRORMESSAGE"]
            } else if errorMessage == "INTERNET_REQUEST_TIMEOUT" {
                params = ["message": "INTERNET_REQUEST_TIMEOUT_MESSAGE"]
            } else {
                params = ["message": "GENERIC_ERROR_MESSAGE"]
            }
            
            let json = JSON(params)
            
            completion(false, json)
            
        case .success(let value):
            
            // Success block
            let json = JSON(value)
            if self.checkAPIStatus(response.response?.statusCode ?? 0) {
                
                completion(true, json)
                
            } else {
                
                var messages = "Some think went wrong"
                let newJSON = JSON(["message": messages])
                completion(false, newJSON)
                
            }
        }
    }
    
    private func manageResponses<T>(for response: DataResponse<T, AFError>, completion: @escaping GenericModelCompletion<T>) {
        print("Status Code: \(response.response?.statusCode ?? 200)")
        
        switch response.result {
        case .failure(let error):
            
            // Failure completion block
            let errorMessage = error.localizedDescription
            print(errorMessage)
            completion(false, errorMessage, nil)
            
        case .success(let value):
            
            // Success block
            if self.checkAPIStatus(response.response?.statusCode ?? 0) {
                completion(true, "", value)
                
            } else {
                
                let messages = "Some thing went wrong"
                completion(false, messages, nil)
                
            }
        }
    }
}
