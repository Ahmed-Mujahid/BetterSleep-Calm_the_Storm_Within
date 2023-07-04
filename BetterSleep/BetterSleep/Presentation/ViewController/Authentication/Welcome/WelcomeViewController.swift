//
//  WelcomeViewController.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import UIKit

class WelcomeViewController: BSBaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var stackviewBottom: NSLayoutConstraint!
    @IBOutlet weak var welcomeLblTop: NSLayoutConstraint!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    // FaceBook
    @IBOutlet weak var fbView: UIView!
    @IBOutlet weak var fbIcon: UIImageView!
    @IBOutlet weak var fBlbl: UILabel!
    @IBOutlet weak var fbBtn: UIButton!
    
    // Google
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var googleIcon: UIImageView!
    @IBOutlet weak var googleLbl: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    
    // Email
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailBtn: UIButton!
    
    // MARK: - Containers
    
    // MARK: - Instances
    var viewModel = WelcomeViewModel()
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        animateView()
        
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        bindButton()
        bindLables()
        
        // Configure call back
        
    }
    
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    func animateView() {
        fbView.fadeIn()
        googleView.fadeIn()
        emailView.fadeIn()
        titleLbl.fadeIn()
        subTitleLbl.fadeIn()
    }
    
}
// MARK: - View Extensions

extension WelcomeViewController {
    func bindButton() {
        fbBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                fbView.applyEfect()
                
            }).disposed(by: disposeBag)
        
        googleBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                googleView.applyEfect()
                
            }).disposed(by: disposeBag)
        
        emailBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                emailView.applyEfect()
//                guard let view = BetterSleepManager.shared.navigateView(viewRef: .LoginViewController, storyboard: .Authentication) as? LoginViewController else { return }
//                self.navigationController?.pushViewController(view, animated: false)
                guard let view = BetterSleepManager.shared.navigateView(viewRef: .BsTabViewController, storyboard: .Main) as? BsTabViewController else { return }
                self.navigationController?.pushViewController(view, animated: true)
            }).disposed(by: disposeBag)
    }
    
    func bindLables() {
        
        // Title Lable
        viewModel.title
            .bind(to: titleLbl.rx.text)
            .disposed(by: disposeBag)
        
        // sub title Lable
        viewModel.subTitle
            .bind(to: subTitleLbl.rx.text)
            .disposed(by: disposeBag)
        
        // Facebook Title
        viewModel.fbTitle
            .bind(to: fBlbl.rx.text)
            .disposed(by: disposeBag)
        
        // Google Title
        viewModel.googleTitle
            .bind(to: googleLbl.rx.text)
            .disposed(by: disposeBag)
        
        // Email Title
        viewModel.emaileTitle
            .bind(to: emailLbl.rx.text)
            .disposed(by: disposeBag)
    }
    
}
