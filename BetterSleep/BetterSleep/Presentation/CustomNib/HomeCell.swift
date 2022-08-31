//
//  HomeCell.swift
//  BetterSleep
//
//  Created by developer on 26/08/2022.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = "HomeCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - IBActions
    
    // MARK: - Custom Functions
}
