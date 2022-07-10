//
//  ViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/06.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    var greetingLabel: UILabel!
    var deliversButton: UIButton!
    var wholeScrollView: UIScrollView!
    var contentView: UIView!
    var loginView: UIView!
    var feedHstackView: UIStackView!
    var adVStackView: UIStackView!
    var newsHeaderHStack: UIStackView!
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillAdVStackView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        adVStackView.removeAllSubViews()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        
        setUpWholeScrollView()
        setUpContentView()
        setUpGreetingLabel()
        setUpLoginView()
        setUpfeedHstackView()
        setUpAdVstackView()
        setUpNewsHeader()
        setUpNewsScroll()
        setUpdeliverButton()
    }
    
    func setUpWholeScrollView() {
        wholeScrollView = UIScrollView()
        wholeScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wholeScrollView)
        NSLayoutConstraint.activate([
            wholeScrollView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor),
            wholeScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            wholeScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            wholeScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)])
    }
    
    func setUpContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        wholeScrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
            contentView.topAnchor.constraint(equalTo: wholeScrollView.topAnchor, constant: 30),
            contentView.bottomAnchor.constraint(equalTo: wholeScrollView.bottomAnchor)])
    }
    
    func setUpGreetingLabel() {
        greetingLabel = UILabel()
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.text = "안녕하세요.\n스타벅스입니다."
        greetingLabel.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        greetingLabel.numberOfLines = 2
        greetingLabel.textAlignment = .left
        contentView.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greetingLabel.topAnchor.constraint(equalTo: contentView.topAnchor)])
    }
    
    func testView() -> UIView {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.backgroundColor = .blue
        return testView
    }
    
    func setUpfeedHstackView() {
 
        feedHstackView = UIStackView()
        feedHstackView.translatesAutoresizingMaskIntoConstraints = false
        feedHstackView.alignment = .center
        feedHstackView.axis = .horizontal
        feedHstackView.spacing = 10
        feedHstackView.distribution = .fillProportionally
        
        let letterImage = UIImageView()
        letterImage.translatesAutoresizingMaskIntoConstraints = false
        letterImage.image = UIImage(systemName: "envelope")
        letterImage.tintColor = UIColor.gray
        feedHstackView.addArrangedSubview(letterImage)
        
        let label = UILabel()
        label.text = "What`s New"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        feedHstackView.addArrangedSubview(label)
        
        let bellImage = UIImageView()
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        bellImage.image = UIImage(systemName: "bell")
        bellImage.tintColor = UIColor.gray
        feedHstackView.addArrangedSubview(bellImage)
        
        contentView.addSubview(feedHstackView)
    
        
        NSLayoutConstraint.activate([
            bellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bellImage.widthAnchor.constraint(equalTo: feedHstackView.widthAnchor, multiplier: 0.06),
            letterImage.widthAnchor.constraint(equalTo: feedHstackView.widthAnchor, multiplier: 0.1),
            letterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            feedHstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedHstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedHstackView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 15)
        ])
    }
    
    func setUpAdVstackView() {
        adVStackView = UIStackView()
        adVStackView.translatesAutoresizingMaskIntoConstraints = false
        adVStackView.alignment = .fill
        adVStackView.axis = .vertical
        adVStackView.spacing = 15
        adVStackView.distribution = .equalSpacing
        contentView.addSubview(adVStackView)
        NSLayoutConstraint.activate([
            adVStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adVStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adVStackView.topAnchor.constraint(equalTo: feedHstackView.bottomAnchor, constant: 15),
        ])
    }
    
    func setUpLoginView() {
        loginView = UIView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.borderColor = UIColor.gray.cgColor
        loginView.layer.borderWidth = 0.5
        
        contentView.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 30),
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
    }
    
    func fillAdVStackView() {
        var isUsed = [Bool](repeating: false, count: 7)
        var i: Int = 0
        
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
                adVStackView.addArrangedSubview(adImage1)
                NSLayoutConstraint.activate([
                    adImage1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
                ])
            case 1:
                let adImage2 = UIImageView()
                adImage2.translatesAutoresizingMaskIntoConstraints = false
                adImage2.image = UIImage(named: "StarbucksAd2")
                adVStackView.addArrangedSubview(adImage2)
                NSLayoutConstraint.activate([
                    adImage2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
                ])
                
            case 2:
                let adImage3 = UIImageView()
                adImage3.translatesAutoresizingMaskIntoConstraints = false
                adImage3.image = UIImage(named: "StarbucksAd3")
                adVStackView.addArrangedSubview(adImage3)
                NSLayoutConstraint.activate([
                    adImage3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
                ])
            case 3:
                let adImage4 = UIImageView()
                adImage4.translatesAutoresizingMaskIntoConstraints = false
                adImage4.image = UIImage(named: "StarbucksAd4")
                adVStackView.addArrangedSubview(adImage4)
                NSLayoutConstraint.activate([
                    adImage4.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
                ])
            case 4:
                let adImage5 = UIImageView()
                adImage5.translatesAutoresizingMaskIntoConstraints = false
                adImage5.image = UIImage(named: "StarbucksAd5")
                adVStackView.addArrangedSubview(adImage5)
                NSLayoutConstraint.activate([
                    adImage5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
                ])
            case 5:
                let adImage6 = UIImageView()
                adImage6.translatesAutoresizingMaskIntoConstraints = false
                adImage6.image = UIImage(named: "StarbucksAd6")
                adVStackView.addArrangedSubview(adImage6)
                NSLayoutConstraint.activate([
                    adImage6.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
                ])
            case 6:
                let adImage5 = UIImageView()
                adImage5.translatesAutoresizingMaskIntoConstraints = false
                adImage5.image = UIImage(named: "StarbucksAd7")
                adVStackView.addArrangedSubview(adImage5)
                NSLayoutConstraint.activate([
                    adImage5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
                ])
            default:
                print("Error in adImageView")
            }
        }
    }
    
    func setUpdeliverButton() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor.appColor(.StarBucksGreen)
        configuration.baseForegroundColor = .white
        configuration.image = UIImage(systemName: "bicycle")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
        let deliverButton = UIButton(configuration: configuration, primaryAction: nil)
        deliverButton.translatesAutoresizingMaskIntoConstraints = false
        deliverButton.addTarget(self, action: #selector(nextView), for: .allTouchEvents)
        
        contentView.addSubview(deliverButton)
        deliverButton.layer.cornerRadius = 35
        deliverButton.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            deliverButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            deliverButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            deliverButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.09),
            deliverButton.widthAnchor.constraint(equalTo: deliverButton.heightAnchor)
        ])
    }
    
    @objc
    func nextView() {
        let rootVC = DeliveryViewController()
        let nextVC = UINavigationController(rootViewController: rootVC)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
     
    func setUpNewsHeader() {
        newsHeaderHStack = UIStackView()
        newsHeaderHStack.translatesAutoresizingMaskIntoConstraints = false
        newsHeaderHStack.alignment = .center
        newsHeaderHStack.axis = .horizontal
        newsHeaderHStack.spacing = 10
        newsHeaderHStack.distribution = .fillProportionally
        
        let label = UILabel()
        label.text = "What`s New"
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textAlignment = .left
        newsHeaderHStack.addArrangedSubview(label)
        
        let seeAllLabel = UILabel()
        seeAllLabel.text = "See all"
        seeAllLabel.font = UIFont.systemFont(ofSize: 15)
        seeAllLabel.textColor = UIColor.appColor(.StarBucksGreen)
        seeAllLabel.textAlignment = .right
        newsHeaderHStack.addArrangedSubview(seeAllLabel)
        
        contentView.addSubview(newsHeaderHStack)
        NSLayoutConstraint.activate([
            newsHeaderHStack.topAnchor.constraint(equalTo: adVStackView.bottomAnchor, constant: 37),
            newsHeaderHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsHeaderHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func setUpNewsScroll() {
        
        let titles = ["22 서머 e-프리퀀시 이벤트 안내", "미션 e-스티커 추가 증정 이벤트",
                    "22 서머 e-프리퀀시 예약시스템 안내", "7월 스타벅스 일회용컵 없는 날 캠페인",
                    "7월 5일, 서머 픽 시트러스 블렌디드 출시", "프리퀀시 프렌즈 MD 소개",
                    "Gift 배송하기 별 2배 적립 혜택"]
        
        let imageNames = ["News1", "News2", "News3", "News4", "News5", "News6", "News7"]
        
        let details = ["즐거운 여행 속 나에게 기대감과 즐거움을 주는 스타벅스의 여름 이야기",
                       "우리의 즐거운 여행을 함께 할 22 서머 e-프리퀀시 선물을 소개합니다.",
                       "e-프리퀀시 증정품을 빠르고 편리하게 만나보세요.",
                       "매월 10일은 일회용 컵 없는 날!",
        "PCIK YOUR DRINK 이벤트를 통해 탄생한 올해 여름 휴가지 원픽 음료",
        "프리퀀시 프렌즈 상품으로 여름 휴가의 설렘을 더해보세요!",
        "Gift 배송하기 주문 시 별★2배 적립"]
        
        
        let newsScroll = UIScrollView()
        newsScroll.translatesAutoresizingMaskIntoConstraints = false
        newsScroll.showsHorizontalScrollIndicator = false
        newsScroll.alwaysBounceVertical = false
        newsScroll.alwaysBounceHorizontal = true

        let scrollHstack = UIStackView()
        scrollHstack.translatesAutoresizingMaskIntoConstraints = false
        scrollHstack.alignment = .fill
        scrollHstack.axis = .horizontal
        scrollHstack.spacing = 10
        scrollHstack.distribution = .fillEqually
        

        let newsView1 = UIView()
        newsView1.translatesAutoresizingMaskIntoConstraints = false
        newsView1.backgroundColor = .blue
        
        let newsView2 = UIView()
        newsView2.translatesAutoresizingMaskIntoConstraints = false
        newsView2.backgroundColor = .red

        
        newsScroll.addSubview(scrollHstack)
        contentView.addSubview(newsScroll)
        
        NSLayoutConstraint.activate([
            newsScroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -15),
            newsScroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            newsScroll.topAnchor.constraint(equalTo: newsHeaderHStack.bottomAnchor, constant: 20),
            newsScroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            scrollHstack.leadingAnchor.constraint(equalTo: newsScroll.leadingAnchor, constant: 15),
            scrollHstack.trailingAnchor.constraint(equalTo: newsScroll.trailingAnchor, constant: -15),
            scrollHstack.topAnchor.constraint(equalTo: newsScroll.topAnchor),
            scrollHstack.bottomAnchor.constraint(equalTo: newsScroll.bottomAnchor),
            scrollHstack.heightAnchor.constraint(equalTo: newsScroll.heightAnchor)
        ])
        
        for i in 0..<imageNames.count {
            let newsVStack = UIStackView()
            scrollHstack.addArrangedSubview(newsVStack)
            newsVStack.translatesAutoresizingMaskIntoConstraints = false
            newsVStack.alignment = .fill
            newsVStack.axis = .vertical
            newsVStack.spacing = 10
            newsVStack.distribution = .fill
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: imageNames[i])
            newsVStack.addArrangedSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.21),
                imageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.65)
            ])
            
            
            let titleLabel = UILabel()
            titleLabel.text = titles[i]
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            titleLabel.textAlignment = .left
            titleLabel.numberOfLines = 1
            newsVStack.addArrangedSubview(titleLabel)
            
            let detailLabel = UILabel()
            detailLabel.text = details[i]
            detailLabel.font = UIFont.systemFont(ofSize: 15)
            detailLabel.textColor = .gray
            detailLabel.textAlignment = .left
            detailLabel.numberOfLines = 2
            newsVStack.addArrangedSubview(detailLabel)
        }

    }
}

