//
//  SignUpValidator.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
class SignUpValidator {
    // MARK: - variables
    var signUpRequestDTO = SignUpRequestDto()
    var viewModel = SignUpViewModel()
    var invalidCredentials: InvalidCredentials = .none
    
    // MARK: - init
    init() {
        
    }
    
    init(_ loginData: SignUpRequestDto, _ viewModel: SignUpViewModel) {
        signUpRequestDTO = loginData
        self.viewModel = viewModel
        invalidCredentials = .none
    }
    
    // MARK: - Methods
    func validateConditions() -> InvalidCredentials {
        
        if signUpRequestDTO.userName.value.lowercased().trim().isEmpty &&
            signUpRequestDTO.email.value.lowercased().trim().isEmpty &&
            signUpRequestDTO.password.value.lowercased().trim().isEmpty {
            invalidCredentials = .ALL_EMPTY
            return invalidCredentials
        }
        
        if !signUpRequestDTO.email.value.isEmail() || signUpRequestDTO.email.value.lowercased().trim().isEmpty {
            invalidCredentials = .EMAIL
            return invalidCredentials
        }

        if signUpRequestDTO.userName.value.lowercased().trim().isEmpty {
            invalidCredentials = .USER_NAME
            return invalidCredentials
        }
        
        if !signUpRequestDTO.password.value.isPassword() || signUpRequestDTO.password.value.lowercased().trim().isEmpty {
            invalidCredentials = .PASSWORD
            return invalidCredentials
        }
        
        return .none
    }
    
}
