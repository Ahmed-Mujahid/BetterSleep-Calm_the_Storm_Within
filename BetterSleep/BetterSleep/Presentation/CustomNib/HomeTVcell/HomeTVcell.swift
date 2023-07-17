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
    
    
    // MARK: - Variables
    let disposeBag = DisposeBag()
    var clickHandler: ((HomeItem) -> Void)?
    var viewModel: HomeTVviewModel? {
        didSet {
            bindCollectionView()
            cellCv.reloadData()
        }
    }
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellCv.delegate = self
        cellCv.register(HomeCVCell.identifier)
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    private func bindCollectionView() {
        
        viewModel?
            .homeItem
            .bind(to: cellCv.rx.items(cellIdentifier: HomeCVCell.identifier, cellType: HomeCVCell.self)) { indexPath, data, cell in
                cell.viewModel = HomeCVcellViewModel(title: data.title,
                                                     image: data.icon,
                                                     isHorizontal: self.viewModel?.isHorizontal ?? true)
            }.disposed(by: disposeBag)
        
        // Model Selected
        cellCv.rx
            .modelSelected(HomeItem.self)
            .subscribe(onNext: { [unowned self] (data) in
                guard let completion = self.clickHandler else {return}
                completion(data)
                
            }).disposed(by: disposeBag)
        
    }
    
    func watchForClickHandler(completion: @escaping (HomeItem) -> Void) {
        self.clickHandler = completion
    }
    
}

extension HomeTVcell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalHomeItem = viewModel?.homeItem.value.count ?? 0
        
        if self.viewModel?.isHorizontal ?? true {
            return CGSize(width: (collectionView.frame.width / 3) + 20,
                          height: collectionView.frame.height)
        } else {
            let halfItems = totalHomeItem  / 2
            let verticalCellHeight = collectionView.frame.height /  CGFloat(halfItems)
            
            return CGSize(width: (collectionView.frame.width / 3) + 30,
                          height: verticalCellHeight)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let leftRight_insets = 20.0
        
        if self.viewModel?.isHorizontal ?? true {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: leftRight_insets, bottom: 0, right: leftRight_insets)
        }
        
    }
}
