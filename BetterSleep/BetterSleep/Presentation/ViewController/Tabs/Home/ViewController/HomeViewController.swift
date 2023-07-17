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
        viewModel.fetchAllSong()
        
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
                    self.adjustScrollHeight()
                }
            }.disposed(by: disposeBag)
        
        viewModel.message.drive(onNext: {(_message) in
            if let message = _message {
                AlertHandler.show(message: message, inViewController: self)
            }
        }).disposed(by: disposeBag)
        
    }
    
    private func adjustScrollHeight() {
        
        for ds in viewModel.homeSection.value {
            switch ds.items {
            case .HorizontalTableViewItem(titles: let homeItem):
                height += (homeItem.count * 60)
                
            case .VerticalTableViewItem(titles: let homeItem):
                height += (homeItem.count * 70)
            }
        }
        height += viewModel.homeSection.value.count * 42 // header height
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
        
        // Biding tableView with homeSection
        viewModel.homeSection
            .observe(on: mainScheduler)
            .bind(to: tableView.rx.items(cellIdentifier: HomeTVcell.identifier, cellType: HomeTVcell.self)) { _, data, cell in
                // Data set
                let section = data.items
                switch section {
                    
                    // Horizontal Cells
                case .HorizontalTableViewItem(titles: let titles):
                    cell.viewModel = HomeTVviewModel(item: titles, isHorizontal: true)
                    cell.cellCv.updateFLow(15, 15, true)
                    cell.cellCv.isScrollEnable(isEnable: true)
                    
                    // Vertical Cells
                case .VerticalTableViewItem(titles: let titles):
                    
                    cell.viewModel = HomeTVviewModel(item: titles, isHorizontal: false)
                    cell.cellCv.updateFLow(5, 5, false)
                    cell.cellCv.alwaysBounceVertical = false
                    cell.cellCv.isScrollEnable(isEnable: false)
                }
                
                //                cell.watchForClickHandler {  data in
                //                    print("data \(data)")
                //                    if let vc = cell.getOwningViewController() as? HomeViewController {
                //                        guard let homeDetailVc = BetterSleepManager.shared.navigateView(viewRef: .HomeDetailViewController, storyboard: .HomeDetail) as? HomeDetailViewController else { return }
                //                        homeDetailVc.viewModel = HomeDetailViewModel(item: data)
                //                       let sheetController = Utility.openSheet(homeDetailVc)
                //                        vc.present(sheetController, animated: true)
                //                    }
                //                }
            }.disposed(by: disposeBag)
        
        // Model Selected Selected
        tableView.rx
            .modelSelected(HomeItem.self)
            .subscribe(onNext: { [unowned self] data in
                
                guard let homeDetailVc = BetterSleepManager.shared.navigateView(viewRef: .HomeDetailViewController, storyboard: .HomeDetail) as? HomeDetailViewController else { return }
                homeDetailVc.viewModel = HomeDetailViewModel(item: data)
                let sheetController = Utility.openSheet(homeDetailVc)
                self.present(sheetController, animated: true)
                
                
                
                // Impact
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }).disposed(by: disposeBag)
        
        // ItemSelected Selected
        //        tableView.rx
        //            .itemSelected
        //            .subscribe(onNext: { [unowned self] indexPath in
        //
        //                // Deselect
        //                tableView.deselectRow(at: indexPath, animated: true)
        //
        //
        //
        //                // Impact
        //                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        //            }).disposed(by: disposeBag)
        
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let sections = viewModel.homeSection.value[indexPath.section].items
        switch sections {
        case .HorizontalTableViewItem(titles: _):
            return  150.0
            
        case .VerticalTableViewItem(titles: let homeItem):
            return  CGFloat(homeItem.count * 75)
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // get the title from the dataSource
        if viewModel.homeSection.value.count > 0 {
            let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 42)
            let headerView = UIView(frame: frame)
            headerView.backgroundColor = .clear
            
            let sectionLabel = UILabel(frame: CGRect(x: 20, y: -20, width: view.bounds.width, height: 42))
            
            let header = viewModel.homeSection.value[section].header
            sectionLabel.text = header
            sectionLabel.textColor = .white
            headerView.addSubview(sectionLabel)
            return headerView
        } else {
            let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 20)
            let headerView = UIView(frame: frame)
            return headerView
        }
    }
}
