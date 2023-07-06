//
//  AppDefaults.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 06/07/2023.
//

import Foundation
class AppDefaults: NSObject {
    
    // MARK: - Shared instance
    static let shared = AppDefaults()
    
    // MARK: - Shared Variables
//    var currentUser = User()
    
    // APP Delegate
    let userDefault = UserDefaults.standard
    
    // MARK: - Shared methods
    
    // MARK: - Custom Data Function to save data
    func getToken() -> String {
        return userDefault.value(forKey:  Constants.accessToken) as? String ?? ""
    }
    
    func saveToken(token: String) {
        userDefault.set(token, forKey:  Constants.accessToken)
        saveContext()
    }
    
    func setUserLogin(_ isLogin: Bool = false) {
        userDefault.setValue(isLogin, forKey:  Constants.isLogin)
    }
    
    func getUserLogin() -> Bool {
        return userDefault.value(forKey:  Constants.isLogin) as? Bool ?? false
    }
    func getRefreshToken() -> String {
        return userDefault.value(forKey:  Constants.refreshToken) as? String ?? ""
    }
    
    func saveRefreshToken(token: String) {
        userDefault.set(token, forKey:  Constants.refreshToken)
        saveContext()
    }
    
    func deleteUserData() {
        userDefault.set(nil, forKey:  Constants.accessToken)
        userDefault.set(nil, forKey:  Constants.refreshToken)
        userDefault.set(nil, forKey:  Constants.userData)
        userDefault.set(false, forKey:  Constants.isLogin)
        saveContext()
    }
    
    private func saveContext() {
        userDefault.synchronize()
    }
}
