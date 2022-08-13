//
//  WelcomeViewModel.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import Foundation
import RxRelay

class WelcomeViewModel: BSBaseViewModel {
    // Relays
    var title: BehaviorRelay<String>
    var subTitle: BehaviorRelay<String>
    var fbTitle: BehaviorRelay<String>
    var googleTitle: BehaviorRelay<String>
    var emaileTitle: BehaviorRelay<String>
    
    // Variable
    
    // Constant
    
    // init
    override init() {
        title = BehaviorRelay(value: "Welcome")
        subTitle = BehaviorRelay(value: "We’re here to better your sleep")
        fbTitle = BehaviorRelay(value: "Continue with Facebook")
        googleTitle = BehaviorRelay(value: "Continue with Google")
        emaileTitle = BehaviorRelay(value: "Continue with Email")
    }
    
    // Methods
    
}
