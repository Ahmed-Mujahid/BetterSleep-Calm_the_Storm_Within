//
//  SignUpViewController.swift
//  BetterSleep
//
//  Created by developer on 14/08/2022.
//

import UIKit

class SignUpViewController: BSBaseViewController {
    
    // MARK: - IBOutlets
    // Top Lables
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    // UserName
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    
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
        loginBtn.adjustFont("ALREADY HAVE AN ACCOUNT? ", "LOG IN")
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
        userNameView.fadeIn()
        emailView.fadeIn()
        passwordView.fadeIn()
        loginBtn.fadeIn()
        signUpBtn.fadeIn()
    }
    
}
// MARK: - View Extensions
extension SignUpViewController {
    func bindButton() {
        
        // show/hide Pass button
        showPassBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
        
        // Login Button
        loginBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                self.navigationController?.popToRootViewController(animated: false)
                
            }).disposed(by: disposeBag)
        
        // SignUp button
        signUpBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
    }
}
