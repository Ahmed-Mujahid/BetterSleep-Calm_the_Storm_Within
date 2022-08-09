//
//  BS_Button.swift
//  BetterSleep
//
//  Created by developer on 10/08/2022.
//

import UIKit

@IBDesignable
class BS_Button: UIView {
    // MARK: - IBOutlets
    
    @IBOutlet weak var buttonLogo: UIImageView!
    @IBOutlet weak var buttonLbl: UILabel!
    @IBOutlet weak var bsButton: UIButton!
    
    
    // MARK: - IBInspectable
    @IBInspectable var buttonTitle = "Enter Title"
    @IBInspectable var buttonIcon: UIImage = UIImage()
    @IBInspectable var textColor: UIColor = BS_Colors.BS_Blue
    
    // MARK: - Containers
    // MARK: - Instances
    // MARK: - Variables
    var clickHandler: ((Int) -> Void)?
    
    // MARK: - Constants
    
    // MARK: - Initialsers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Navigation / IBActions
    @IBAction func bsButtonTapped(_ sender: UIButton) {
        guard let completion = self.clickHandler else { return }
        self.applyEfect()
        completion(0)
    }
    
    // MARK: - Custom Funtions
    func commonInit() {
        if let viewFromXib = Bundle.main.loadNibNamed("BS_Button", owner: self, options: nil)![0] as? UIView {
            viewFromXib.frame = self.bounds
            buttonLbl.text = buttonTitle
            buttonLbl.textColor = textColor
            buttonLogo.image = buttonIcon
            addSubview(viewFromXib)
        }
    }
    
    func watchForClickHandler(completion: @escaping (Int) -> Void) {
        self.clickHandler = completion
    }
    
}

