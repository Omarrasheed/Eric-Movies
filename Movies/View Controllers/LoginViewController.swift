//
//  ViewController.swift
//  Movies
//
//  Created by Omar Rasheed on 1/26/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var circlesImageView: UIImageView!
    var loginLabel: UILabel!
    var signupLabel: UILabel!
    var emailIDLabel: UILabel!
    var passwordLabel: UILabel!
    var emailIDTextField: UITextField!
    var emailIDTextFieldSeperator: UIView!
    var passwordTextField: UITextField!
    var passwordTextFieldSeperator: UIView!
    var forgotPasswordButton: UIButton!
    var loginButton: UIButton!
    var alreadyUserLabel: UILabel!
    var signupNowButton: UIButton!
    var signupStackView: UIStackView!
    
    var greyColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:1)
    var blueColor = UIColor(red:0.13, green:0.31, blue:0.84, alpha:1)
    var borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        addHideKeyboardRecognizer()
        
        setupCirclesImageView()
        setupLoginLabel()
        setupSignupLabel()
        setupEmailIDLabel()
        setupEmailTextField()
        setupEmailIDTextFieldSeperator()
        setupPasswordLabel()
        setupPasswordTextField()
        setupPasswordTextFieldSeperator()
        setupForgotPasswordButton()
        setupLoginButton()
        setupSignupStackView()
        
        setupConstraints()
    }
    
    func addHideKeyboardRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func setupCirclesImageView() {
        circlesImageView = UIImageView(image: UIImage(named: "Circles"))
        view.addSubview(circlesImageView)
    }

    func setupLoginLabel() {
        
        loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(loginLabel)
    }
    
    func setupSignupLabel() {
        signupLabel = UILabel()
        signupLabel.text = "Signin to your account to continue"
        signupLabel.textColor = greyColor
        signupLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(signupLabel)
    }

    func setupEmailIDLabel() {
        emailIDLabel = UILabel()
        emailIDLabel.text = "EMAIL ID"
        emailIDLabel.textColor = greyColor
        emailIDLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(emailIDLabel)
    }
    
    func setupEmailTextField() {
        emailIDTextField = UITextField()
        emailIDTextField.placeholder = "johndoe@example.com"
        emailIDTextField.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(emailIDTextField)
    }
    
    func setupEmailIDTextFieldSeperator() {
        emailIDTextFieldSeperator = UIView()
        emailIDTextFieldSeperator.layer.borderWidth = 1
        emailIDTextFieldSeperator.layer.borderColor = borderColor
        view.addSubview(emailIDTextFieldSeperator)
    }
    
    func setupPasswordLabel() {
        passwordLabel = UILabel()
        passwordLabel.text = "PASSWORD"
        passwordLabel.textColor = greyColor
        passwordLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(passwordLabel)
    }
    
    func setupPasswordTextField() {
        passwordTextField = UITextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "johndoe123"
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(passwordTextField)
    }
    
    func setupPasswordTextFieldSeperator() {
        passwordTextFieldSeperator = UIView()
        passwordTextFieldSeperator.layer.borderWidth = 1
        passwordTextFieldSeperator.layer.borderColor = borderColor
        view.addSubview(passwordTextFieldSeperator)
    }
    
    func setupForgotPasswordButton() {
        forgotPasswordButton = UIButton()
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.setTitleColor(blueColor, for: .normal)
        view.addSubview(forgotPasswordButton)
    }
    
    func setupLoginButton() {
        loginButton = UIButton()
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 245, height: 40)
        gradient.colors = [
            UIColor(red:0.05, green:0.3, blue:0.66, alpha:1).cgColor,
            UIColor(red:0.19, green:0.38, blue:0.94, alpha:1).cgColor
        ]
        
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 1, y: 0.5)
        gradient.endPoint = CGPoint(x: 0, y: 0.5)
        gradient.cornerRadius = 20
        loginButton.layer.addSublayer(gradient)
        
        loginButton.layer.cornerRadius = 20
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 14)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        view.addSubview(loginButton)
    }
    
    func setupAlreadyUserLabel() {
        alreadyUserLabel = UILabel()
        alreadyUserLabel.text = "Already a user?"
        alreadyUserLabel.font = .systemFont(ofSize: 14)
    }
    
    func setupSignupNowButton() {
        signupNowButton = UIButton()
        signupNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        signupNowButton.setTitle("Sign up now", for: .normal)
        signupNowButton.setTitleColor(blueColor, for: .normal)
    }
    
    func setupSignupStackView() {
        setupAlreadyUserLabel()
        setupSignupNowButton()
        
        signupStackView = UIStackView(arrangedSubviews: [alreadyUserLabel, signupNowButton])
        signupStackView.alignment = .center
        view.addSubview(signupStackView)
    }
    
    @objc func login() {
        
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func setupConstraints() {
        
        circlesImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(72)
        }
        
        loginLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(circlesImageView.snp.bottom).offset(50)
            make.width.equalTo(loginLabel.intrinsicContentSize.width)
            make.height.equalTo(loginLabel.intrinsicContentSize.height)
        }
        
        signupLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginLabel.snp.bottom).offset(14)
            make.centerX.equalTo(loginLabel.snp.centerX)
            make.width.equalTo(signupLabel.intrinsicContentSize.width)
            make.height.equalTo(signupLabel.intrinsicContentSize.height)
        }
        
        emailIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(signupLabel.snp.bottom).offset(220)
            make.leading.equalToSuperview().inset(32)
            make.width.equalTo(emailIDLabel.intrinsicContentSize.width)
            make.height.equalTo(emailIDLabel.intrinsicContentSize.height)
        }
        
        emailIDTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailIDLabel.snp.bottom).offset(12)
            make.leading.equalTo(emailIDLabel)
            make.trailing.equalToSuperview().inset(32)
            make.height.equalTo(emailIDTextField.intrinsicContentSize.height)
        }
        
        emailIDTextFieldSeperator.snp.makeConstraints { (make) in
            make.top.equalTo(emailIDTextField.snp.bottom).offset(14)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailIDTextFieldSeperator.snp.bottom).offset(42)
            make.leading.equalTo(emailIDLabel)
            make.width.equalTo(passwordLabel.intrinsicContentSize.width)
            make.height.equalTo(passwordLabel.intrinsicContentSize.height)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(12)
            make.leading.equalTo(emailIDLabel)
            make.trailing.equalToSuperview().inset(32)
            make.height.equalTo(passwordTextField.intrinsicContentSize.height)
        }
        
        passwordTextFieldSeperator.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(14)
            make.height.equalTo(1)
            make.leading.trailing.equalTo(emailIDTextFieldSeperator)
        }
        
        forgotPasswordButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(passwordTextFieldSeperator).inset(14)
            make.top.equalTo(passwordTextFieldSeperator.snp.bottom).offset(16)
            make.height.equalTo(forgotPasswordButton.titleLabel!.intrinsicContentSize.height)
            make.width.equalTo(forgotPasswordButton.titleLabel!.intrinsicContentSize.width)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        
        signupStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(loginButton).inset(16)
            make.height.equalTo(20)
            make.top.equalTo(loginButton.snp.bottom).offset(24)
        }
    }
}

