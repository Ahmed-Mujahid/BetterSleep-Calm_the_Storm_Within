//
//  HomeViewController.swift
//  BetterSleep
//
//  Created by developer on 02/08/2022.
//

import UIKit

class HomeViewController: BSBaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Containers
    
    // MARK: - Instances
    var viewModel = HomeViewModel()
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.confirmRx(self, disposeBag)
        tableView.register(HomeTVcell.identifier)
        viewModel.fetchData()
        
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        bindTableView()
        
        // Configure call back
        
    }
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    
}
// MARK: - View Extensions
extension HomeViewController {
    private func bindTableView() {
        viewModel.homeItem
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
}
