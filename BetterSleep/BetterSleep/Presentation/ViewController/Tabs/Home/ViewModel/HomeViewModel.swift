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
    case NATURE = "Nature"
    case SEA_WAVES = "Sea Waves"
    case AMBIENT_MUSIC = "Ambient music"
}

class HomeViewModel: BSBaseViewModel {
    
    // MARK: - Relay
    var homeItem: BehaviorRelay<[AdvancedTableViewSection]>
    var succusType: BehaviorRelay<SongCategory> = BehaviorRelay(value: .SLEEP_MEDITATION)
    
    var homeSection: BehaviorRelay<[HomeSection]>
    var section = [AdvancedTableViewSection]()
    
    // MARK: - Variable
    var categories: SleepMediation?
    
    // MARK: - Constants
    let dispatchGroup = DispatchGroup()
    let repository = SleepMediationMock()
    let dataSource = HomeItemDS.dataSource()
    
    // MARK: - init
    override init() {
        homeItem = BehaviorRelay(value: [])
        homeSection = BehaviorRelay(value: [])
    }
    
    // MARK: - Methods
    func fetchSong(by category: SongCategory,
                   isHorizontal: Bool = true) {
        
        print("category: \(category.rawValue)")
        var tempSection = self.homeItem.value
        
        self.isSuccess.accept(false)
        self.isLoading.accept(true)
        repository.fetchSong(by: category.rawValue) { success, message, model in
            self.isLoading.accept(false)
            if success {
                if let homeItem = model {
                    if isHorizontal {
                        tempSection.append(.HorizontalSection(items: [.HorizontalTableViewItem(titles: homeItem)]))
                    } else {
                        tempSection.append(.VerticalSection(items: [.VerticalTableViewItem(titles: homeItem)]))
                    }
                    self.homeItem.accept(tempSection)
                }
                self.succusType.accept(category)
                self.isSuccess.accept(true)
            } else {
                self.setMessage(message)
            }
        }
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
