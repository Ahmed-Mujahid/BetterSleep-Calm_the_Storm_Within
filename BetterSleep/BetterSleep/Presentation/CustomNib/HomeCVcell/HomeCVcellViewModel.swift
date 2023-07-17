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
    var image: String
    var isHorizontal: Bool
    override init() {
        title = ""
        image = ""
        isHorizontal = false
    }
    
    init(title: String, image: String, isHorizontal: Bool) {
        self.title = title
        self.image = image
        self.isHorizontal = isHorizontal
    }
}
