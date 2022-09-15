//
//  HomeViewModel.swift
//  BetterSleep
//
//  Created by developer on 26/08/2022.
//

import Foundation
import UIKit
import RxDataSources
import RxSwift
import RxCocoa
import SwiftUI

struct HomeItem {
    let title: String
    let icon: UIImage
    
    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
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
    
    // MARK: - Relay
    var homeItem: BehaviorRelay<[HomeSection]>
    
    // MARK: - Variable
    let dataSource = HomeItemDS.dataSource()
    
    // MARK: - init
    override init() {
        var homeSection = [HomeSection]()
        let musicItem: [HomeItem] = [
            HomeItem(title: "Music1", icon: BSImages.BS_Music1),
            HomeItem(title: "Music2", icon: BSImages.BS_Music1),
            HomeItem(title: "Music3", icon: BSImages.BS_Music1)
        ]
        
        let podCaseItem: [HomeItem] = [
            HomeItem(title: "Podcast1", icon: BSImages.BS_Podcast1),
            HomeItem(title: "Podcast2", icon: BSImages.BS_Podcast2),
            HomeItem(title: "Podcast3", icon: BSImages.BS_Podcast3)
        ]
        
        let categoryItem: [HomeItem] = [
            HomeItem(title: "Sleep", icon: BSImages.BS_Sleep),
            HomeItem(title: "Relax", icon: BSImages.BS_Relax),
            HomeItem(title: "Medidate", icon: BSImages.BS_Medidate),
            HomeItem(title: "Yoga", icon: BSImages.BS_Yoga)
        ]
        
        homeSection.append(HomeSection(items: musicItem, header: "Music"))
        homeSection.append(HomeSection(items: podCaseItem, header: "Podcast"))
        homeSection.append(HomeSection(items: categoryItem, header: "Categories"))
        
        // Initialising Relay
        homeItem = BehaviorRelay(value: homeSection)
       
    }
    // MARK: - methods
}

extension HomeSection: SectionModelType {
    typealias Item = HomeItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}
