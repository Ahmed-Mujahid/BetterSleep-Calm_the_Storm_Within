//
//  HomeItemDS.swift
//  BetterSleep
//
//  Created by developer on 31/08/2022.
//

import Foundation
import RxDataSources
import RxCocoa
import RxSwift

typealias HomeItemDataSource = RxTableViewSectionedReloadDataSource

enum AdvancedTableViewItem {
    /// Represents a cell with a collection view inside
    case HorizontalTableViewItem(titles: [HomeItem])
    case VerticalTableViewItem(titles: [HomeItem])
}

enum AdvancedTableViewSection {
    case HorizontalSection(items: [AdvancedTableViewItem])
    case VerticalSection(items: [AdvancedTableViewItem])
}

extension AdvancedTableViewSection: SectionModelType {
    
    
    typealias Item = AdvancedTableViewItem
    // "Grid Section"
    // "Custom Section"
    
    var items: [AdvancedTableViewItem] {
        switch self {
        case .HorizontalSection(items: let items):
            return items
        case .VerticalSection(items: let items):
            return items
        }
    }
    
    var header: String {
        switch self {
        case .HorizontalSection:
            return "Grid Section"
            
        case .VerticalSection:
            return "Vertical Section"
        }
    }
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct HomeItemDS {
    
    static func dataSource() ->  HomeItemDataSource<AdvancedTableViewSection> {
        return .init(configureCell: { ds, tableView, indexPath, item -> UITableViewCell in
            
            // Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVcell.identifier, for: indexPath) as? HomeTVcell else { return UITableViewCell() }
            let section = ds[indexPath]
            switch section {
                
                // Horizontal Cells
            case .HorizontalTableViewItem(titles: let titles):
                cell.viewModel = HomeTVviewModel(item: titles, isHorizontal: true)
                cell.cellCv.updateFLow(15, 15, true)
                cell.cellCv.isScrollEnable(isEnable: true)
                
                // Vertical Cells
            case .VerticalTableViewItem(titles: let titles):
                
                cell.viewModel = HomeTVviewModel(item: titles, isHorizontal: false)
                cell.cellCv.updateFLow(5, 5, false)
                cell.cellCv.alwaysBounceVertical = false
                cell.cellCv.isScrollEnable(isEnable: false)
            }
            
            cell.watchForClickHandler {  data in
                print("data \(data)")
                if let vc = cell.getOwningViewController() as? HomeViewController {
                    guard let homeDetailVc = BetterSleepManager.shared.navigateView(viewRef: .HomeDetailViewController, storyboard: .HomeDetail) as? HomeDetailViewController else { return }
                    homeDetailVc.viewModel = HomeDetailViewModel(item: data)
                   let sheetController = Utility.openSheet(homeDetailVc)
                    vc.present(sheetController, animated: true)
                }
            }
            
            // Return Cell
            return cell
        })
    }
}
