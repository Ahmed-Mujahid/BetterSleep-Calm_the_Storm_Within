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
    // MARK: - PROPERTIES
    let title: String
    let icon: UIImage
    let detail: String
    
    // MARK: - INITIALSERS
    init() {
        title = ""
        icon = UIImage()
        detail = ""
    }
    
    init(title: String, icon: UIImage, detail: String = "") {
        self.title = title
        self.icon = icon
        self.detail = detail
    }
    
}

struct HomeSection {
    let items: [HomeItem]
    let header: String
    
}

extension HomeSection: SectionModelType {
    typealias Item = HomeItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

class HomeViewModel: BSBaseViewModel {
    
    // MARK: - Relay
    var homeItem: BehaviorRelay<[AdvancedTableViewSection]>
    
    // MARK: - Variable
    let dataSource = HomeItemDS.dataSource()
    let repository = SleepMediationRepository()
    var categories: SleepMediation?
    
    // MARK: - init
    override init() {
        homeItem = BehaviorRelay(value: [])
    }
    
    // MARK: - Methods
    
    func fetchCategories() {
        repository.fetchCategory { success, message, model in
            self.categories = model as? SleepMediation
            print("categories: \(self.categories)")
        }
    }
    
    func fetchData() {
        
        let musicItem: [HomeItem] = [
            HomeItem(title: "Music1", icon: BSImages.BS_Music1),
            HomeItem(title: "Music2", icon: BSImages.BS_Music2),
            HomeItem(title: "Music3", icon: BSImages.BS_Music3)
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
            HomeItem(title: "Yoga", icon: BSImages.BS_Yoga),
            HomeItem(title: "Sleep1", icon: BSImages.BS_Sleep),
            HomeItem(title: "Relax1", icon: BSImages.BS_Relax),
            HomeItem(title: "Medidate1", icon: BSImages.BS_Medidate),
            HomeItem(title: "Yoga1", icon: BSImages.BS_Yoga)
        ]
        
        var homeSection = [AdvancedTableViewSection]()
        
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: musicItem)]))
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: podCaseItem)]))
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: musicItem)]))
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: podCaseItem)]))
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: musicItem)]))
        homeSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: podCaseItem)]))
        homeSection.append(.VerticalSection(items: [.VerticalTableViewItem(titles: categoryItem)]))
        
        // Initialising Relay
        homeItem = BehaviorRelay(value: homeSection)
        self.isSuccess.accept(true)
    }
    
    // MARK: - methods
}
