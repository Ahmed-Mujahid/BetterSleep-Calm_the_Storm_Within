//
//  HomeDetailViewModel.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 05/07/2023.
//

import Foundation
import RxSwift
import RxCocoa

class HomeDetailViewModel: BSBaseViewModel {
    // MARK: - Relay
    var item: BehaviorRelay<HomeItem> = BehaviorRelay(value: HomeItem())
    
    // MARK: - Variable
    
    // MARK: - init
    override init() {
        
    }
    
    init(item: HomeItem) {
        self.item.accept(item) 
    }
    
    // MARK: - Methods
}
