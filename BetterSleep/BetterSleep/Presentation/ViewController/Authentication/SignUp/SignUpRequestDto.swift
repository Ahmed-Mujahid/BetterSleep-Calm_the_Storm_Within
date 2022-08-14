//
//  SignUpRequestDto.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
import RxRelay
import RxSwift

struct SignUpRequestDto {
    var userName: BehaviorRelay<String>
    var email: BehaviorRelay<String>
    var password: BehaviorRelay<String>
    
    // MARK: - Initialiser
    init() {
        userName = BehaviorRelay(value: "")
        email = BehaviorRelay(value: "")
        password = BehaviorRelay(value: "")
    }
    
}
