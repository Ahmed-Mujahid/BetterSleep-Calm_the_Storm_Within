//
//  HomeCVcellViewModel.swift
//  BetterSleep
//
//  Created by developer on 08/09/2022.
//

import Foundation
import UIKit

class HomeCVcellViewModel: BSBaseViewModel {
    var title: String
    var image: UIImage
    
    override init() {
        title = ""
        image = UIImage()
    }
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}
