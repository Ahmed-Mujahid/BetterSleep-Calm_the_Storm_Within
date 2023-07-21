//
//  HomeViewController.swift
//  BetterSleep
//
//  Created by developer on 02/08/2022.
//

import UIKit
import Cell_Rx

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
    let headerHeight = 42.0
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView configuration
        tableViewCofig()
        mainViewHeight.constant =  0.0
        // scrollView configuration
        scrollView.delegate = self
        
        // fetching data
        viewModel.fetchSong(by: .SLEEP_MEDITATION)
        
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
        // loading
        viewModel.isLoading
            .bind(to: self.view.rx.isShowHUD)
            .disposed(by: disposeBag)
        // success
        viewModel.isSuccess
            .asObservable()
            .filter { $0 }.bind { success in
                if success {
                    
                    let type = self.viewModel.succusType.value
                    switch type {
                        
                    case .SLEEP_MEDITATION:
                        self.viewModel.fetchSong(by: .RELAX)
                      
                    case .RELAX:
                        self.viewModel.fetchSong(by: .PEACE_FULL)
                        
                    case .PEACE_FULL:
                        self.viewModel.fetchSong(by: .NATURE)
                        
                    case .NATURE:
                        self.viewModel.fetchSong(by: .SEA_WAVES)
                        
                    case .SEA_WAVES:
                        self.viewModel.fetchSong(by: .AMBIENT_MUSIC, isHorizontal: false)
                       
                    case .AMBIENT_MUSIC:
                        self.adjustScrollHeight()
                    }
                    
                    
                }
            }.disposed(by: disposeBag)
        
        viewModel.message.drive(onNext: {(_message) in
            if let message = _message {
                AlertHandler.show(message: message, inViewController: self)
            }
        }).disposed(by: disposeBag)
        
    }
    
    private func adjustScrollHeight() {
        
//        for ds in viewModel.homeSection.value {
//            switch ds.items {
        
        for ds in viewModel.dataSource.sectionModels {
            switch ds.items.first {

            case .HorizontalTableViewItem(titles: _):
                height += 150 //(homeItem.count * 60)
                print("==> height 1 \(height)")
            case .VerticalTableViewItem(titles: let homeItem):
                height += (homeItem.count * 75)
                print("==> height 2 \(height)")
            case .none:
                height = 0

            }
        }
        print("==> height 3 \(height)")
        
        // 1200 |+ 280
        height += viewModel.dataSource.sectionModels.count * Int(headerHeight) // header height
        
        print("==> height 4 \(height)")
        mainViewHeight.constant = CGFloat(height) + headerHeight
        
        print("==> height 5 \(mainViewHeight.constant)")
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
        
        // Biding tableView with homeSection
        viewModel.homeItem
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        let sections = viewModel.homeSection.value[indexPath.section].items
//        switch sections {
        let sections = viewModel.dataSource[indexPath.section].items
        switch sections.first {

        case .HorizontalTableViewItem(titles: _):
            return  150
            
        case .VerticalTableViewItem(titles: let homeItem):
            return  CGFloat(homeItem.count * 75)
            
        case .none:
            return  0.0

        }
    }
     
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return headerHeight
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // get the title from the dataSource
        let frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: headerHeight)
        let headerView = UIView(frame: frame)
        headerView.backgroundColor = .clear
        
        let sectionLabel = UILabel(frame: CGRect(x: 20, y: -20, width: tableView.bounds.width, height: headerHeight))

        // get the title from the dataSource
        let sections = viewModel.dataSource[section].items
        switch sections.first {
        case .HorizontalTableViewItem(titles: let homeItem), .VerticalTableViewItem(titles: let homeItem):
            sectionLabel.text =  homeItem.first?.title
        case .none:
            sectionLabel.text =  ""
        }
        sectionLabel.textColor = .white
        sectionLabel.font = UIFont(name: "Roboto-Medium", size: 16)
        headerView.addSubview(sectionLabel)
        
        return headerView

    }
}
