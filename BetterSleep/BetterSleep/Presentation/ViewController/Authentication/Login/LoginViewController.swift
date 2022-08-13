//
//  LoginViewController.swift
//  BetterSleep
//
//  Created by developer on 13/08/2022.
//

import UIKit

class LoginViewController: BSBaseViewController {
    
    // MARK: - IBOutlets
    // Top Lables
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    // Email
    @IBOutlet weak var emailAddresLbl: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var checkMarkIcon: UIImageView!
    @IBOutlet weak var emailTF: UITextField!
    
    // Password
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var showPassBtn: UIButton!
    
    // Forgot Password
    @IBOutlet weak var forgotPassBtn: UIButton!
    
    // Login
    @IBOutlet weak var loginBtn: UIButton!
    
    // SignUp
    @IBOutlet weak var signUpBtn: UIButton!
    
    // MARK: - Containers
    
    // MARK: - Instances
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        signUpBtn.adjustFont("DON’T HAVE AN ACCOUNT? ", "SIGN UP")
        animateView()
        
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        bindButton()
        
        // Configure call back
        
    }
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    func animateView() {
        titleLbl.fadeIn()
        subTitleLbl.fadeIn()
        emailView.fadeIn()
        passwordView.fadeIn()
        forgotPassBtn.fadeIn()
        loginBtn.fadeIn()
        signUpBtn.fadeIn()
    }
    
}
// MARK: - View Extensions
extension LoginViewController {
    func bindButton() {
        showPassBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
        
        forgotPassBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
        
        loginBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
        
        signUpBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                guard let view = BetterSleepManager.shared.navigateView(viewRef: .SignUpViewController, storyboard: .Authentication) as? SignUpViewController else { return }
                self.navigationController?.pushViewController(view, animated: false)
            
            }).disposed(by: disposeBag)
    }
}
