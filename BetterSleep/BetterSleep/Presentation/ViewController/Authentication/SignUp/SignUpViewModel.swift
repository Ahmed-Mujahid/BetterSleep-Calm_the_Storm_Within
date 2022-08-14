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
    
    // Variable
    
    // Constant
    
    // init
    override init() {
        title = BehaviorRelay(value: "Login")
        subTitle = BehaviorRelay(value: "Welcome we’re glad you’re back")
        userName = BehaviorRelay(value: "Forgot Password?")
        email = BehaviorRelay(value: "Email Address")
        pasword = BehaviorRelay(value: "Password")
        haveAccount = BehaviorRelay(value: NSAttributedString("ALREADY HAVE AN ACCOUNT?  \\LOG IN"))
        signup = BehaviorRelay(value: "SIGN UP")
    }
    
    // Methods
    
}
