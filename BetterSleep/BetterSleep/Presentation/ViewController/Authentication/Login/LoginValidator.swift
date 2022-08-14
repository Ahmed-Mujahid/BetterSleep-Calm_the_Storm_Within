//
//  LoginValidator.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
import RxRelay

enum InvalidCredentials {
    case password
    case email
    case none
}

class LoginValidator {
    // MARK: - variables
    var loginRequestDTO = LoginRequestDTO()
    var viewModel = LoginViewModel()
    var invalidCredentials: InvalidCredentials = .none
    
    // MARK: - init
    init() {
        
    }
    
    init(_ loginData: LoginRequestDTO, _ viewModel: LoginViewModel) {
        loginRequestDTO = loginData
        self.viewModel = viewModel
        invalidCredentials = .none
    }
    
    // MARK: - Methods
    func validateEmpty() -> Bool {
        if loginRequestDTO.email.value.lowercased().trim().isEmpty {
            viewModel.setError("Please provide email address")
            return false
        }
        
        if  loginRequestDTO.password.value.lowercased().trim().isEmpty {
            viewModel.setError("Please provide password")
            return false
        }
        return true
    }
    
    func validateConditions() -> InvalidCredentials {
        if !loginRequestDTO.email.value.isEmail() {
            invalidCredentials = .email
            return invalidCredentials
        }
        
        if !loginRequestDTO.password.value.isPassword() {
            invalidCredentials = .password
            return invalidCredentials
        }
        
        return .none
    }
    
}
