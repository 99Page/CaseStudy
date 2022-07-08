//
//  ViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/06.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    var greetingLabel1: UILabel!
    var deliversButton: UIButton!
    var wholeScrollView: UIScrollView!
    var contentView: UIView!
    
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

    

        contentView = UIView()
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
        configuration.baseBackgroundColor = UIColor.appColor(.StarBucksGreen)
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
        configuration.baseForegroundColor = UIColor.appColor(.StarBucksGreen)
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.background.strokeColor = UIColor.appColor(.StarBucksGreen)
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
            coffeImage.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.17),
            coffeImage.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor)
        ])
        
        let feedHstackView = setUpfeedHstackView()
        NSLayoutConstraint.activate([
            feedHstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedHstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedHstackView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 15)
        ])
        
        let adVstackView = setUpAdVstackView()
        NSLayoutConstraint.activate([
            adVstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adVstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adVstackView.topAnchor.constraint(equalTo: feedHstackView.bottomAnchor, constant: 15),
            adVstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let deliverButton = setUpdeliverButton()
        NSLayoutConstraint.activate([
            deliverButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10),
            deliverButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            deliverButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.09),
            deliverButton.widthAnchor.constraint(equalTo: deliverButton.heightAnchor)
        ])
    
//        let testView = testView()
//        contentView.addSubview(testView)
//        NSLayoutConstraint.activate([
//            testView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            testView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            testView.topAnchor.constraint(equalTo: feedHstackView.bottomAnchor),
//            testView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 2),
//            testView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//
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
        contentView.addSubview(stackH)
        
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
            bellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bellImage.widthAnchor.constraint(equalTo: stackH.widthAnchor, multiplier: 0.06),
            letterImage.widthAnchor.constraint(equalTo: stackH.widthAnchor, multiplier: 0.1),
            letterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        return stackH
    }
    
    func setUpAdVstackView() -> UIStackView {
        let stackV = UIStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.alignment = .fill
        stackV.axis = .vertical
        stackV.spacing = 15
        stackV.distribution = .equalSpacing
        
        var isUsed = [Bool](repeating: false, count: 7)
        var i: Int = 0
        
        contentView.addSubview(stackV)
        
        while i < 5 {
            let randInt = Int.random(in: 0..<7)
            
            if (isUsed[randInt]) {
                continue
            }
            
            i += 1
            isUsed[randInt] = true

            switch randInt {
            case 0:
                let adImage1 = UIImageView()
                adImage1.translatesAutoresizingMaskIntoConstraints = false
                adImage1.image = UIImage(named: "StarbucksAd1")
                stackV.addArrangedSubview(adImage1)
                NSLayoutConstraint.activate([
                    adImage1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
                ])
            case 1:
                let adImage2 = UIImageView()
                adImage2.translatesAutoresizingMaskIntoConstraints = false
                adImage2.image = UIImage(named: "StarbucksAd2")
                stackV.addArrangedSubview(adImage2)
                NSLayoutConstraint.activate([
                    adImage2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
                ])
                
            case 2:
                let adImage3 = UIImageView()
                adImage3.translatesAutoresizingMaskIntoConstraints = false
                adImage3.image = UIImage(named: "StarbucksAd3")
                stackV.addArrangedSubview(adImage3)
                NSLayoutConstraint.activate([
                    adImage3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
                ])
            case 3:
                let adImage4 = UIImageView()
                adImage4.translatesAutoresizingMaskIntoConstraints = false
                adImage4.image = UIImage(named: "StarbucksAd4")
                stackV.addArrangedSubview(adImage4)
                NSLayoutConstraint.activate([
                    adImage4.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
                ])
            case 4:
                let adImage5 = UIImageView()
                adImage5.translatesAutoresizingMaskIntoConstraints = false
                adImage5.image = UIImage(named: "StarbucksAd5")
                stackV.addArrangedSubview(adImage5)
                NSLayoutConstraint.activate([
                    adImage5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
                ])
            case 5:
                let adImage6 = UIImageView()
                adImage6.translatesAutoresizingMaskIntoConstraints = false
                adImage6.image = UIImage(named: "StarbucksAd6")
                stackV.addArrangedSubview(adImage6)
                NSLayoutConstraint.activate([
                    adImage6.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
                ])
            case 6:
                let adImage5 = UIImageView()
                adImage5.translatesAutoresizingMaskIntoConstraints = false
                adImage5.image = UIImage(named: "StarbucksAd7")
                stackV.addArrangedSubview(adImage5)
                NSLayoutConstraint.activate([
                    adImage5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
                ])
            default:
                print("Error in adImageView")
            }
        }
        return stackV
    }
    
    func setUpdeliverButton() -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor.appColor(.StarBucksGreen)
        configuration.baseForegroundColor = .white
        configuration.image = UIImage(systemName: "bicycle")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(button)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        
        return button
    }
}
