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
    case GridTableViewItem(titles: [HomeItem])
}

enum AdvancedTableViewSection {
    case GridSection(items: [AdvancedTableViewItem])
}

extension AdvancedTableViewSection: SectionModelType {
    
    
    typealias Item = AdvancedTableViewItem
    // "Grid Section"
    // "Custom Section"

    var items: [AdvancedTableViewItem] {
        switch self {
        case .GridSection(items: let items):
            return items
        }
    }
    
    var header: String {
        switch self {
        case .GridSection:
            return "Grid Section"
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
           
            switch ds[indexPath] {
                
            case .GridTableViewItem(titles: let titles):
                cell.viewModel = HomeTVviewModel(item: titles)
            }
            
//            // ViewModel
//            let sectionItems = ds.sectionModels[indexPath.section].items
//
//            print("sectionModels count: \(ds.sectionModels.count)")
//            print("sectionItems: \(sectionItems)")
//            cell.viewModel = HomeTVviewModel(item: sectionItems)
            
            // Return Cell
            return cell
        }, titleForHeaderInSection: { ds, row in
            let sections = ds[row].items
            switch sections.first {
            case .GridTableViewItem(titles: let homeItem):
                return homeItem.first?.title
            case .none:
                return ""
            }
        })
    }
}
