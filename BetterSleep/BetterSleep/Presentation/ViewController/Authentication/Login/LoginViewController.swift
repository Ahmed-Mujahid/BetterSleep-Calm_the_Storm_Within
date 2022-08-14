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
    var viewModel = LoginViewModel()
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        animateView()
        emailTF.delegate = self
        passwordTF.delegate = self
        checkMarkIcon.isHidden = true
        
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        bindButton()
        bindText()
        bindTF()
        
        // Subcribe
        subcribeInvalidCredentials()
        
        // Configure call back
        configureServiceCallBacks()
        
    }
    
    // MARK: - Navigation / IBActions
    
    // MARK: - Custom Funtions
    func animateView() {
        titleLbl.fadeIn()
        subTitleLbl.fadeIn()
        emailAddresLbl.fadeIn()
        emailView.fadeIn()
        passwordLbl.fadeIn()
        passwordView.fadeIn()
        forgotPassBtn.fadeIn()
        loginBtn.fadeIn()
        signUpBtn.fadeIn()
    }
    
}

// MARK: - Binding
extension LoginViewController {
    func bindButton() {
        showPassBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
            }).disposed(by: disposeBag)
        
        forgotPassBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { _ in
                
            }).disposed(by: disposeBag)
        
        loginBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                viewModel.authenticate()
                
            }).disposed(by: disposeBag)
        
        signUpBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                guard let view = BetterSleepManager.shared.navigateView(viewRef: .SignUpViewController, storyboard: .Authentication) as? SignUpViewController else { return }
                self.navigationController?.pushViewController(view, animated: false)
            
            }).disposed(by: disposeBag)
    }
    
    func bindText() {
        
        // Title Lable
        viewModel.title
            .bind(to: titleLbl.rx.text)
            .disposed(by: disposeBag)
        
        // sub title Lable
        viewModel.subTitle
            .bind(to: subTitleLbl.rx.text)
            .disposed(by: disposeBag)
        
        // email Title
        viewModel.email
            .bind(to: emailAddresLbl.rx.text)
            .disposed(by: disposeBag)
        
        // password Title
        viewModel.pasword
            .bind(to: passwordLbl.rx.text)
            .disposed(by: disposeBag)
        
        // Forgot password Title
        viewModel.forgotPassword
            .bind(to: forgotPassBtn.rx.title(for: .normal))
            .disposed(by: disposeBag)
        
        // dontHaveAccount attributed title
        viewModel.dontHaveAccount
            .bind(to: signUpBtn.rx.bsAttributedTitle(sepratedby: "\\", .white, BSColors.BS_Purple))
            .disposed(by: disposeBag)
    }
    
    func bindTF() {
        // Email TextFeild
        emailTF.rx.text
            .orEmpty
            .bind(to: viewModel.requestDto.email)
            .disposed(by: disposeBag)
        
        // Pasword TextFeild
        passwordTF.rx.text
            .orEmpty
            .bind(to:  viewModel.requestDto.password)
            .disposed(by: disposeBag)
    }

}
// MARK: - Subcribe Relay
extension LoginViewController {
    func subcribeInvalidCredentials() {
        viewModel.inValidCredential
               .observe(on: mainScheduler)
               .subscribe(onNext: { [unowned self] invalid in
                   switch invalid {
                   case .email:
                       emailView.shake(duration: 1)
                   case .password:
                       passwordView.shake(duration: 1)
                   case .none:
                       break
                   }
               }).disposed(by: disposeBag)
    }
  
    
}

// MARK: - Configure callback
extension LoginViewController {
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
                    
                }
            }.disposed(by: disposeBag)
        
        viewModel.message.drive(onNext: {(_message) in
            if let message = _message {
                AlertHandler.show(message: message, inViewController: self)
            }
        }).disposed(by: disposeBag)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTF {
            if viewModel.validateCondition() == .email {
                checkMarkIcon.isHidden = false
                checkMarkIcon.image = BSImages.BS_Reject
            } else {
                checkMarkIcon.isHidden = false
                checkMarkIcon.image = BSImages.BS_CheckMark
            }
        }
    }
}
