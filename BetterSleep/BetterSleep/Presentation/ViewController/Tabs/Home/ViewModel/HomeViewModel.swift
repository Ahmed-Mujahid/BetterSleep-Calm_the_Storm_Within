//
//  HomeViewModel.swift
//  BetterSleep
//
//  Created by developer on 26/08/2022.
//

import Foundation
import RxSwift
import RxCocoa

enum SongCategory: String, CaseIterable {
    case SLEEP_MEDITATION = "Sleep Mediation"
    case RELAX = "Relax"
    case PEACE_FULL = "Peace Full"
//    case NATURE = "Nature"
//    case SEA_WAVES = "Sea Waves"
//    case AMBIENT_MUSIC = "Ambient music"
}

class HomeViewModel: BSBaseViewModel {
    
    // MARK: - Relay
    var homeSection: BehaviorRelay<[HomeSection]>
    var section = [HomeSection]()
    
    // MARK: - Variable
    var categories: SleepMediation?
    
    // MARK: - Constants
    let dispatchGroup = DispatchGroup()
    let repository = SleepMediationRepository()
    // MARK: - init
    override init() {
        homeSection = BehaviorRelay(value: [])
    }
    
    // MARK: - Methods
    func fetchSong(by category: String, isHorizontal: Bool = true, completion: @escaping GenericCompletion) {
       print("categor: \(category)")
        repository.fetchSong(by: category) { success, message, model in
//            self.isLoading.accept(false)
            if success {
                if let homeItem = model {
                    var section =  self.section
                    var item = HomeSection()
                    if isHorizontal {
                        item = HomeSection(items: .HorizontalTableViewItem(titles: homeItem), header: category)
                    } else {
                        item = HomeSection(items: .VerticalTableViewItem(titles: homeItem), header: category)
                    }
               
                    section.append(item)
                    self.section = section
                }
                
                self.isSuccess.accept(true)
            } else {
                self.setMessage(message)
            }
            completion()
        }
    }
    
    func fetchAllSong() {
        self.isLoading.accept(true)
        
        dispatchGroup.enter()
        dispatchGroup.enter()
        dispatchGroup.enter()
        
        for category in SongCategory.allCases {
            self.fetchSong(by: category.rawValue) {
                self.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main, execute: {
            self.homeSection.accept(self.section)
            self.isLoading.accept(false)
            self.isSuccess.accept(true)
         })
    }
    
    func downloadSong(){
        let hits = self.categories?.tracks?.hits?.first
        
        
        self.repository.fetchMusic(for: hits?.track?.hub?.actions?.last?.uri) { _, _, path in
            if let url = path as? String {
                BetterSleepManager.shared.filePath = url
                
            }
            print("downloded path \(path ?? "")")
        }
    }
}

enum AdvancedTableViewItem {
    /// Represents a cell with a collection view inside
    case HorizontalTableViewItem(titles: [HomeItem])
    case VerticalTableViewItem(titles: [HomeItem])
}

struct HomeItem {
    // MARK: - PROPERTIES
    let title: String
    let icon: String
    let detail: String
    var url: String
    
    // MARK: - INITIALSERS
    init() {
        title = Constants.blankValue
        icon = Constants.blankValue
        detail = Constants.blankValue
        url = Constants.blankValue
    }
    
    init(title: String, icon: String, detail: String = "", url: String = "") {
        self.title = title
        self.icon = icon
        self.detail = detail
        self.url = url
    }
    
}

struct HomeSection {
  
    let items: AdvancedTableViewItem
    let header: String
    
    init() {
        items = .HorizontalTableViewItem(titles: [HomeItem]())
        header = Constants.blankValue
    }
    
    init(items: AdvancedTableViewItem, header: String) {
        self.items = items
        self.header = header
    }
    
}
