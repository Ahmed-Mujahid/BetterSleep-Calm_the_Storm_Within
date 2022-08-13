//
//  LoginViewModel.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import Foundation
import RxRelay

class LoginViewModel: BSBaseViewModel {
    // Relays
    var title: BehaviorRelay<String>
    var subTitle: BehaviorRelay<String>
    var emailPasword: BehaviorRelay<String>
    var pasword: BehaviorRelay<String>
    
    // Variable
    
    // Constant
    
    // init
    override init() {
        title = BehaviorRelay(value: "Login")
        subTitle = BehaviorRelay(value: "Welcome we’re glad you’re back")
        emailPasword = BehaviorRelay(value: "")
        pasword = BehaviorRelay(value: "")
    }
    
    // Methods
    
}
