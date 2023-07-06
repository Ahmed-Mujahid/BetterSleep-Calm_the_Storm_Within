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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollMainView: UIView!
    
    // MARK: - Containers
    
    // MARK: - Instances
    var viewModel = HomeViewModel()
    
    // MARK: - Variables
    var height = 20
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView configuration
        tableViewCofig()
        
        // scrollView configuration
        scrollView.delegate = self
        
        // fetching data
        viewModel.fetchCategories()
        viewModel.fetchData()
        
        // Binding view
        bindTableView()
        
        // Configure call back
        configureServiceCallBacks()
        
    }
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    /// isLoading: Displays HUD from API called to end
    /// isSuccess: a succes message if API
    private func configureServiceCallBacks() {
        
        // success
        viewModel.isSuccess
            .asObservable()
            .filter { $0 }.bind { success in
                if success {
                    self.adjustScrollHeight()
                }
            }.disposed(by: disposeBag)
        
    }
    
    private func adjustScrollHeight() {
        
        for ds in viewModel.dataSource.sectionModels {
            switch ds.items.first {
            case .HorizontalTableViewItem(titles: let homeItem):
                height += (homeItem.count * 60)
                
            case .VerticalTableViewItem(titles: let homeItem):
                height += (homeItem.count * 70)
                
            case .none:
                height = 0
            }
        }
        height += viewModel.dataSource.sectionModels.count * 42 // header height
        mainViewHeight.constant = CGFloat(height)
    }
    
    func tableViewCofig(){
        tableView.confirmRx(self, disposeBag)
        tableView.register(HomeTVcell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    
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
        
        let sections = viewModel.dataSource[indexPath.section].items
        switch sections.first {
        case .HorizontalTableViewItem(titles: _):
            return  150.0
            
        case .VerticalTableViewItem(titles: let homeItem):
            return  CGFloat(homeItem.count * 75)
            
        case .none:
            return  150.0
            
        }
        
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
