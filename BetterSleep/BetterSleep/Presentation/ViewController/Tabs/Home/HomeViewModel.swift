//
//  HomeViewModel.swift
//  BetterSleep
//
//  Created by developer on 26/08/2022.
//

import Foundation
import UIKit
import RxDataSources

struct HomeItem {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

struct HomeSection {
    let items: [HomeItem]
    let header: String
    
    init(items: [HomeItem], header: String) {
        self.items = items
        self.header = header
    }
}

class HomeViewModel: BSBaseViewModel {
    
}


extension HomeSection: SectionModelType {
    typealias Item = HomeItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}
