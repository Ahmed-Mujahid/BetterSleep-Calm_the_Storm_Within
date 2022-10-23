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
        tableView.separatorStyle = .none
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 42)
        let headerView = UIView(frame: frame)
        headerView.backgroundColor = .clear
        
        let sectionLabel = UILabel(frame: CGRect(x: 20, y: -20, width: view.bounds.width, height: 42))
        
        // get the title from the dataSource
        let sections = viewModel.dataSource[section].items
        switch sections.first {
        case .HorizontalTableViewItem(titles: let homeItem), .VerticalTableViewItem(titles: let homeItem):
            sectionLabel.text =  homeItem.first?.title
            
        case .none:
            sectionLabel.text =  ""
        }
        sectionLabel.textColor = .white
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
}

extension HomeViewController: UIScrollViewDelegate {
    
    func adjustTopView(_ height: CGFloat) {
        view.layoutIfNeeded()
        headerViewHeight.constant = height
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // checks if srollview of tableview is scrolled
        if let item = scrollView as? UITableView {
            if item != tableView {
                return
            }
            
            // Getting frame size for table view
            let viewoffset = tableView.frame.size.height + tableView.frame.origin.y
            
            // on specific value adjust top View
            if scrollView.contentOffset.y > 10 {
                
                adjustTopView(0)
                
            } else if scrollView.contentOffset.y <= 50 {
                
                adjustTopView(200)
                
            } else if viewoffset < scrollView.contentOffset.y {
                
                // expand the header
                adjustTopView(200)
                
            }
            
            // Animating while expanding top view
            UIView.animate(withDuration: 0.7, delay: 0, options: [.allowUserInteraction], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
