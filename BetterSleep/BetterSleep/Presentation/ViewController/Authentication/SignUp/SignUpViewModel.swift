//
//  SignUpViewModel.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
import RxRelay

class SignUpViewModel: BSBaseViewModel {
    // Relays
    var title: BehaviorRelay<String>
    var subTitle: BehaviorRelay<String>
    var userName: BehaviorRelay<String>
    var email: BehaviorRelay<String>
    var pasword: BehaviorRelay<String>
    var haveAccount: BehaviorRelay<NSAttributedString>
    var signup: BehaviorRelay<String>
    var inValidCredential: BehaviorRelay<InvalidCredentials>
    var passwordPolicy: BehaviorRelay<String>
    
    // Variable
    var requestDto: SignUpRequestDto
    
    // Constant
    
    // init
    override init() {
        title = BehaviorRelay(value: "Sign Up")
        subTitle = BehaviorRelay(value: "Let’s get started to better your sleep")
        userName = BehaviorRelay(value: "Username")
        email = BehaviorRelay(value: "Email Address")
        pasword = BehaviorRelay(value: "Password")
        haveAccount = BehaviorRelay(value: NSAttributedString("ALREADY HAVE AN ACCOUNT?  \\LOG IN"))
        signup = BehaviorRelay(value: "SIGN UP")
        passwordPolicy = BehaviorRelay(value: "Password should contain Atleast one Captial Letter, special character (!@#$%^&*()_+) and digit (0 - 9)")
        inValidCredential = BehaviorRelay(value: .none)
        requestDto = SignUpRequestDto()
    }
    
    // Methods
    /// Validates if data is empty
    /// - Returns: true if all conditions are met else return false
    func validate() -> Bool {
        let validation = SignUpValidator(requestDto, self)
        inValidCredential.accept(validation.validateConditions())
        return (inValidCredential.value == .none)
    }
    
    func validateCondition() -> InvalidCredentials {
        let validation = SignUpValidator(requestDto, self)
        return validation.validateConditions()
    }
    
    func register() {
       
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
