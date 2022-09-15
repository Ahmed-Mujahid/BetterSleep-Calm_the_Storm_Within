//
//  HomeCVCell.swift
//  BetterSleep
//
//  Created by developer on 08/09/2022.
//

import UIKit

class HomeCVCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = "HomeCVCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainView: CardView!
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    // MARK: - Variables
    var viewModel: HomeCVcellViewModel? {
        didSet {
            prepareCell()
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
    func prepareCell() {
        cellLbl.text = viewModel?.title
        cellImage.image = viewModel?.image
    }
}
