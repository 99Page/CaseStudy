//
//  LoginViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/11.
//

import UIKit

class LoginViewController: UIViewController {
    
    var idString: String?
    var pwString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "로그인"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
//        navigationItem.backBarButtonItem
        
        self.tabBarController?.tabBar.isHidden = true
        
        let baseWidth = view.widthAnchor
        let baseHeight = view.heightAnchor
        let safeArea = view.safeAreaLayoutGuide
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        scrollView.addSubview(starbuckLogoImage)
        NSLayoutConstraint.activate([
            starbuckLogoImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            starbuckLogoImage.widthAnchor.constraint(equalTo: baseWidth, multiplier: 0.2),
            starbuckLogoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            starbuckLogoImage.heightAnchor.constraint(equalTo: baseWidth, multiplier: 0.2)
        ])
        
        scrollView.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: starbuckLogoImage.bottomAnchor, constant: 15),
            greetingLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        ])
        
        
        scrollView.addSubview(guideLabel)
        NSLayoutConstraint.activate([
            guideLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10),
            greetingLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        ])
        
        
        scrollView.addSubview(idTextField)
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 70),
            idTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            idTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        setIdText()
        
        scrollView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 35),
            passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor)
        ])
        setPWText()
        
        scrollView.addSubview(helperHStack)
        NSLayoutConstraint.activate([
            helperHStack.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            helperHStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            helperHStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -300)
        ])
        
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            loginButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let starbuckLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "StarbucksLogo")
        return imageView
    }()
    
    let loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "로그인하기"
        configuration.baseBackgroundColor = UIColor.appColor(.StarBucksGreen)
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        let loginButton = UIButton(configuration: configuration, primaryAction: nil)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        return loginButton
    }()
    
    let greetingLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.text = "안녕하세요.\n스타벅스입니다."
        uiLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        uiLabel.numberOfLines = 2
        uiLabel.textAlignment = .left
        return uiLabel
    }()
    
    let guideLabel: UILabel = {
        let guideLable = UILabel()
        guideLable.translatesAutoresizingMaskIntoConstraints = false
        guideLable.text = "회원 서비스 이용을 위해 로그인 해주세요."
        guideLable.font = UIFont.systemFont(ofSize: 16)
        return guideLable
    }()
    
    let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        return idTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        passwordTextField.isSecureTextEntry = true
        
        return passwordTextField
    }()
    
    let helperHStack: UIStackView = {
        let helperHStack = UIStackView()
        helperHStack.translatesAutoresizingMaskIntoConstraints = false
        helperHStack.spacing = 10
        
        let findIDLabel = UILabel()
        findIDLabel.translatesAutoresizingMaskIntoConstraints = false
        findIDLabel.text = "아이디 찾기"
        findIDLabel.font = UIFont.systemFont(ofSize: 15)
        
        let verticalDivider1 = UILabel()
        verticalDivider1.translatesAutoresizingMaskIntoConstraints = false
        verticalDivider1.text = "|"
        verticalDivider1.textColor = .lightGray
        verticalDivider1.font = UIFont.systemFont(ofSize: 13)
        
        let verticalDivider2 = UILabel()
        verticalDivider2.translatesAutoresizingMaskIntoConstraints = false
        verticalDivider2.text = "|"
        verticalDivider2.textColor = .lightGray
        verticalDivider2.font = UIFont.systemFont(ofSize: 13)
        
        let findPWLable = UILabel()
        findPWLable.translatesAutoresizingMaskIntoConstraints = false
        findPWLable.text = "비밀번호 찾기"
        findPWLable.font = UIFont.systemFont(ofSize: 15)
        
        let signUpLabel = UILabel()
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.text = "회원가입 "
        signUpLabel.font = UIFont.systemFont(ofSize: 15)
        
        helperHStack.addArrangedSubview(findIDLabel)
        helperHStack.addArrangedSubview(verticalDivider1)
        helperHStack.addArrangedSubview(findPWLable)
        helperHStack.addArrangedSubview(verticalDivider2)
        helperHStack.addArrangedSubview(signUpLabel)
        
        return helperHStack
    }()
    
    func setIdText() {
        guard let string = idString else { return }
        idTextField.text = string
    }
    
    func setPWText() {
        guard let pwString = pwString else { return }
        passwordTextField.text = pwString
    }
}
