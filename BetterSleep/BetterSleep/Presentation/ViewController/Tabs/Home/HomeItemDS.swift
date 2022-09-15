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

struct HomeItemDS {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource<HomeSection> {
        return .init { ds, collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withIdentifier: HomeTVcell.identifier, for: indexPath) as? HomeTVcell else { return UITableViewCell() }
            
            let items = ds[indexPath.row].items
            cell.viewModel
            cell.viewModel = HomeTVviewModel(item: item)
            cell.bindCollectionView()
            
//            if !cell.viewModel?.homeItem.value.isEmpty {
//                item.
//                    .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
//                    .disposed(by: disposeBag)
//            }
            return cell
        } titleForHeaderInSection: { ds, row in
            return ds[row].header
        }
    }
}
