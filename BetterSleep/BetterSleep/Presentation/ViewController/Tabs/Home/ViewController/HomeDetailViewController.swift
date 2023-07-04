//
//  HomeDetailViewController.swift
//  BetterSleep
//
//  Created by Ahmed Mujahid on 05/07/2023.
//

import UIKit

class HomeDetailViewController: BSBaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    // MARK: - Variables
    var viewModel: HomeDetailViewModel?
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        subcribeItem()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.containerView.fadeIn()
        }
        
        // Navigation Setting
    }
    
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    func subcribeItem() {
        guard let viewModel = viewModel else { return }
        viewModel.item
            .observe(on: mainScheduler)
            .subscribe(onNext: { [unowned self] data in
                imageView.image = data.icon
                detailLbl.text = data.detail
                titleLbl.text = data.title
            }).disposed(by: disposeBag)
    }
    
}

// MARK: - View Extensions
