//
//  LoginRequestDTO.swift.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import Foundation
import RxRelay
import RxSwift

struct LoginRequestDTO {
    var email: BehaviorRelay<String>
    var password: BehaviorRelay<String>
    
    // MARK: - Initialiser
    init() {
        email = BehaviorRelay(value: "")
        password = BehaviorRelay(value: "")
    }
    
}
