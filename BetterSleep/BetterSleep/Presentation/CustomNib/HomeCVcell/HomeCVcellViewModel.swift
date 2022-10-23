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
    var isHorizontal: Bool
    override init() {
        title = ""
        image = UIImage()
        isHorizontal = false
    }
    
    init(title: String, image: UIImage, isHorizontal: Bool) {
        self.title = title
        self.image = image
        self.isHorizontal = isHorizontal
    }
}
