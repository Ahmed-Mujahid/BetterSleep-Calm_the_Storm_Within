//
//  BSBaseViewModel.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import Foundation
import RxSwift
import RxCocoa

enum SuccessType {
    case WELCOME
    case NONE
}

class BSBaseViewModel {
    
    // MARK: - Private Constants
    let bag = DisposeBag()
    
    // MARK: - Variables
    private let error = BehaviorRelay<Bool>(value: false)
    private let errorMessage = BehaviorRelay<String?>(value: nil)
    let type = BehaviorRelay<SuccessType>(value: .NONE)
    
    // MARK: - Model Function
    var hasError: Bool {
        return error.value
    }
    
    var message: Driver<String?> {
        return errorMessage.asDriver()
    }
    
    func setError(_ message: String) {
        self.error.accept(true)
        self.errorMessage.accept(message)
    }
    
    func setMessage(_ message: String) {
        self.error.accept(true)
        self.errorMessage.accept(message)
    }
    
    func getError() -> String {
        return errorMessage.value ?? ""
    }
    
    // RX
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
}
