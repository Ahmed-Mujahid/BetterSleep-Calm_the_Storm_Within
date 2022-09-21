//
//  HomeTVcell.swift
//  BetterSleep
//
//  Created by developer on 08/09/2022.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI

class HomeTVcell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "HomeTVcell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var cellCv: UICollectionView!
    var count = 0
    let disposeBag = DisposeBag()
    
    // MARK: - Variables
    var viewModel: HomeTVviewModel? {
        didSet {
            bindCollectionView()
        }
    }
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellCv.delegate = self
        cellCv.register(HomeCVCell.identifier)
        cellCv.updateFLow(5, 5, true)
        
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    private func bindCollectionView() {
    
        viewModel?.homeItem
            .bind(to: cellCv.rx.items(cellIdentifier: HomeCVCell.identifier,
                                              cellType: HomeCVCell.self)) { indexPath, data, cell in
                cell.viewModel = HomeCVcellViewModel(title: data.title, image: data.icon)
                
            }.disposed(by: disposeBag)
        
    }
}

extension HomeTVcell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print( viewModel?.homeItem.value.count ?? 0)
//        return viewModel?.homeItem.value.count ?? 0
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVCell.identifier, for: indexPath) as? HomeCVCell else { return UICollectionViewCell() }
//        if let data = viewModel?.homeItem.value[indexPath.item] {
//            cell.viewModel = HomeCVcellViewModel(title: data.title, image: data.icon)
//        }
//        return cell
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
}
