//
//  HomeTVviewModel.swift
//  BetterSleep
//
//  Created by developer on 08/09/2022.
//

import Foundation
import RxRelay

class HomeTVviewModel: BSBaseViewModel {
    // MARK: - Relau
    var homeItem: BehaviorRelay<[HomeItem]> = BehaviorRelay(value: [])
    var isHorizontal: Bool
    
    // MARK: - init
    init(item: [HomeItem], isHorizontal: Bool) {
        homeItem = BehaviorRelay(value: item)
        self.isHorizontal = isHorizontal
    }
}
