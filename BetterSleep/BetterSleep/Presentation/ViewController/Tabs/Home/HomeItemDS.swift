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

struct HomeItemDS {
       
    static func dataSource() ->  HomeItemDataSource<HomeSection> {
        return .init(configureCell: { ds, tableView, indexPath, item -> UITableViewCell in
            
            // Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVcell.identifier, for: indexPath) as? HomeTVcell else { return UITableViewCell() }
           
            // ViewModel
            let sectionItems = ds.sectionModels[indexPath.section].items
            
            print("sectionModels count: \(ds.sectionModels.count)")
            print("sectionItems: \(sectionItems)")
            cell.viewModel = HomeTVviewModel(item: sectionItems)
            cell.cellCv.reloadData()
            
            // Return Cell
            return cell
        }, titleForHeaderInSection: { ds, row in
            return ds.sectionModels[row].header
        })
    }
}
