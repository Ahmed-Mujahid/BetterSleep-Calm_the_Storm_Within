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
    var viewModel = SignUpViewModel()
    
    // MARK: - Variables
    
    // MARK: - Constants
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        checkMarkIcon.isHidden = true
        animateView()
        userNameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        
        // Navigation Setting
        
        // Setup View
        
        // Binding view
        bindButton()
        bindTF()
        bindText()
        
        // Subcribe Relay
        subcribeInvalidCredentials()
        
        // Configure call back
        configureServiceCallBacks()
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
                self.navigationController?.popToRootViewController(animated: true)
                
            }).disposed(by: disposeBag)
        
        // SignUp button
        signUpBtn.rx.tap
            .`do`(onNext: { _ in
                
            }).subscribe(onNext: { [unowned self] in
                viewModel.register()
                
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
        
        // dontHaveAccount attributed title
        viewModel.haveAccount
            .bind(to: loginBtn.rx.bsAttributedTitle(sepratedby: "\\", .white, BSColors.BS_Purple))
            .disposed(by: disposeBag)
        
        viewModel.title
            .bind(to: signUpBtn.rx.title(for: .normal))
            .disposed(by: disposeBag)
    }

    func bindTF() {
        // username TextFeild
        userNameTF.rx.text
            .orEmpty
            .bind(to: viewModel.requestDto.userName)
            .disposed(by: disposeBag)
        
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
extension SignUpViewController {
    func subcribeInvalidCredentials() {
        viewModel.inValidCredential
               .observe(on: mainScheduler)
               .subscribe(onNext: { [unowned self] invalid in
                   switch invalid {
                   case .EMAIL:
                       emailView.shake(duration: 1)
                   case .PASSWORD:
                       passwordView.shake(duration: 1)
                   case .USER_NAME:
                       userNameView.shake(duration: 1)
                   case .ALL_EMPTY:
                       emailView.shake(duration: 1)
                       passwordView.shake(duration: 1)
                       userNameView.shake(duration: 1)
                   default:
                       break
                   }
               }).disposed(by: disposeBag)
    }
}

// MARK: - Configure callback
extension SignUpViewController {
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

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTF {
            if viewModel.validateCondition() == .EMAIL {
                checkMarkIcon.isHidden = false
                checkMarkIcon.image = BSImages.BS_Reject
            } else {
                checkMarkIcon.isHidden = false
                checkMarkIcon.image = BSImages.BS_CheckMark
            }
        }
    }
}
