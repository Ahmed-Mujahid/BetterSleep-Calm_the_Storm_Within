//
//  HomeTVviewModel.swift
//  BetterSleep
//
//  Created by developer on 08/09/2022.
//

import Foundation
import RxRelay

class HomeTVviewModel: BSBaseViewModel {
    var homeItem: BehaviorRelay<[HomeItem]>
    var isBind = false
    
   override init() {
       homeItem = BehaviorRelay(value: [HomeItem(title: "", icon: UIImage())])
    }
    
    init(item: [HomeItem]) {
        homeItem = BehaviorRelay(value: item)
    }
}
