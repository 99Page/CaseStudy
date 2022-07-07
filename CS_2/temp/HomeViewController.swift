//
//  ViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    var greetingLabel1: UILabel!
    var deliversButton: UIButton!
    var wholeScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        wholeScrollView = UIScrollView()
        wholeScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wholeScrollView)
        NSLayoutConstraint.activate([
            wholeScrollView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor),
            wholeScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            wholeScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            wholeScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)])

    

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        wholeScrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            contentView.topAnchor.constraint(equalTo: wholeScrollView.topAnchor, constant: 30),
            contentView.bottomAnchor.constraint(equalTo: wholeScrollView.bottomAnchor)])
        
        greetingLabel1 = UILabel()
        greetingLabel1.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel1.text = "안녕하세요.\n스타벅스입니다."
        greetingLabel1.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        greetingLabel1.numberOfLines = 2
        greetingLabel1.textAlignment = .left
        contentView.addSubview(greetingLabel1)
        NSLayoutConstraint.activate([
            greetingLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greetingLabel1.topAnchor.constraint(equalTo: contentView.topAnchor)])
        
        let loginView = UIView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.borderColor = UIColor.gray.cgColor
        loginView.layer.borderWidth = 0.5
        
        contentView.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: greetingLabel1.bottomAnchor, constant: 30),
            loginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        let loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "스타벅스 리워드\n회원 신규가입 첫 구매 시,\n무료음료 혜택을 드려요!"
        loginLabel.font = UIFont.systemFont(ofSize: 16)
        loginLabel.numberOfLines = 3
        loginLabel.textAlignment = .left
        loginView.addSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 15),
            loginLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 15)
        ])
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = "회원 가입"
        configuration.baseBackgroundColor = .green
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
        let signUpButton = UIButton(configuration: configuration, primaryAction: nil)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -30)
        ])
        
        configuration.title = "로그인"
        configuration.baseForegroundColor = .green
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.background.strokeColor = .green
        let loginButton = UIButton(configuration: configuration, primaryAction: nil)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.borderColor = UIColor.red.cgColor
        loginView.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: signUpButton.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: 20)
        ])
        
        let coffeImage = UIImageView()
        coffeImage.translatesAutoresizingMaskIntoConstraints = false
        coffeImage.image = UIImage(named: "Coffee")
        loginView.addSubview(coffeImage)
        NSLayoutConstraint.activate([
            coffeImage.topAnchor.constraint(equalTo: loginLabel.topAnchor),
            coffeImage.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 10),
            coffeImage.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -15),
            coffeImage.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.23),
            coffeImage.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor)
        ])
        
        let feedHstackView = setUpfeedHstackView()
        contentView.addSubview(feedHstackView)
        NSLayoutConstraint.activate([
            feedHstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedHstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedHstackView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 15)
        ])
        
        let testView = testView()
        contentView.addSubview(testView)
        NSLayoutConstraint.activate([
            testView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            testView.topAnchor.constraint(equalTo: feedHstackView.bottomAnchor),
            testView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 2),
            testView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func testView() -> UIView {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.backgroundColor = .blue
        return testView
    }
    
    func setUpfeedHstackView() -> UIStackView {
        let stackH = UIStackView()
        stackH.translatesAutoresizingMaskIntoConstraints = false
        stackH.alignment = .center
        stackH.axis = .horizontal
        stackH.spacing = 10
        stackH.distribution = .fillProportionally
        
        let letterImage = UIImageView()
        letterImage.translatesAutoresizingMaskIntoConstraints = false
        letterImage.image = UIImage(systemName: "envelope")
        letterImage.tintColor = UIColor.gray
        stackH.addArrangedSubview(letterImage)
        
        let label = UILabel()
        label.text = "What`s New"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        stackH.addArrangedSubview(label)
        
        let bellImage = UIImageView()
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        bellImage.image = UIImage(systemName: "bell")
        bellImage.tintColor = UIColor.gray
        stackH.addArrangedSubview(bellImage)
        
        NSLayoutConstraint.activate([
            bellImage.trailingAnchor.constraint(equalTo: stackH.trailingAnchor),
            bellImage.widthAnchor.constraint(equalTo: stackH.widthAnchor, multiplier: 0.08),
            letterImage.widthAnchor.constraint(equalTo: stackH.widthAnchor, multiplier: 0.1)
        ])
        
        return stackH
    }
    
    func setUPAdVstackView() -> UIStackView {
        let stackV = UIStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.alignment = .center
        stackV.axis = .vertical
        stackV.spacing = 10
        stackV.distribution = .fillProportionally
        
        return stackV
    }
    
    
}
