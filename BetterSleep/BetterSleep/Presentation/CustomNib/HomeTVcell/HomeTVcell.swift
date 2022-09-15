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
    var viewModel: HomeTVviewModel? {
        didSet {
//            bindCollectionView()
            print("HomeTVviewModel")
        }
    }
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
    
    func bindCollectionView() {
        
        if  !(viewModel?.isBind ?? false) {
            viewModel?.homeItem.observe(on: MainScheduler.instance)
                .bind(to: cellCv.rx.items(cellIdentifier: HomeCVCell.identifier, cellType: HomeCVCell.self)) { row, data, cell in
                    // Cell Data
                    cell.viewModel = HomeCVcellViewModel(title: data.title, image: data.icon)

                }.disposed(by: DisposeBag())
        
                
            print("isBind: \(viewModel?.isBind)")
            print("CollectionView is binding")
            viewModel?.isBind = true
        }
    }
}
