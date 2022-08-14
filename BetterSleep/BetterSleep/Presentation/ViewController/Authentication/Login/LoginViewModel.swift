//
//  LoginViewModel.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import Foundation
import RxRelay

class LoginViewModel: BSBaseViewModel {
    // MARK: - Relays
    var title: BehaviorRelay<String>
    var subTitle: BehaviorRelay<String>
    var email: BehaviorRelay<String>
    var pasword: BehaviorRelay<String>
    var forgotPassword: BehaviorRelay<String>
    var dontHaveAccount: BehaviorRelay<NSAttributedString>
    var inValidCredential: BehaviorRelay<InvalidCredentials>
    
    // MARK: - Variable
    var requestDto: LoginRequestDTO

    // MARK: - Constant
    
    // MARK: - init
    override init() {
        title = BehaviorRelay(value: "Login")
        subTitle = BehaviorRelay(value: "Welcome we’re glad you’re back")
        email = BehaviorRelay(value: "Email Address")
        pasword = BehaviorRelay(value: "Password")
        forgotPassword = BehaviorRelay(value: "Forgot Password?")
        dontHaveAccount = BehaviorRelay(value: NSAttributedString("DON’T HAVE AN ACCOUNT? \\SIGN UP"))
        inValidCredential = BehaviorRelay(value: .none)
        requestDto = LoginRequestDTO()
    }
    
    // MARK: - Methods
    /// Validates if data is empty
    /// - Returns: true if all conditions are met else return false
    func validate() -> Bool {
        let validation = LoginValidator(requestDto, self)
        inValidCredential.accept(validation.validateConditions())
        return (inValidCredential.value == .none)
    }
    
    func validateCondition() -> InvalidCredentials {
        let validation = LoginValidator(requestDto, self)
        return validation.validateConditions()
    }
    
    func authenticate() {
       
        if validate() {
            self.isLoading.accept(true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isLoading.accept(false)
                self.setError("Logged In")
            }
            self.isSuccess.accept(true)
        } else {
            self.isSuccess.accept(false)
        }
    }
}
