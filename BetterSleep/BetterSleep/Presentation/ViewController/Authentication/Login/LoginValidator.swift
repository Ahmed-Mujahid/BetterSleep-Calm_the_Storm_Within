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
    func validateConditions() -> InvalidCredentials {
        if !loginRequestDTO.email.value.isEmail() || loginRequestDTO.email.value.lowercased().trim().isEmpty {
            invalidCredentials = .email
            return invalidCredentials
        }
        
        if !loginRequestDTO.password.value.isPassword() || loginRequestDTO.password.value.lowercased().trim().isEmpty {
            invalidCredentials = .password
            return invalidCredentials
        }
        
        return .none
    }
    
}
