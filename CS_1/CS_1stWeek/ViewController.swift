//
//  ViewController.swift
//  CS_1stWeek
//
//  Created by 노우영 on 2022/07/02.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var navigationTitle: UINavigationItem!
    @IBOutlet var wholeScrollView: UIScrollView!
    @IBOutlet var adScrollView: UIScrollView!
    @IBOutlet var adPageControl: UIPageControl!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var secondView: UIView!
    
    let adImageNames: [String] = ["쿠팡광고1", "쿠팡광고3", "쿠팡광고4", "쿠팡광고5"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScrollView()
        setUpPageControl()
        imageAdd()
        setNavigationTitle()
    }
    
    func setNavigationTitle() {
        let image = UIImage(named: "CoupangLogo")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
        let searchBarImage = UIImage()
        searchBar.backgroundImage = searchBarImage
        
        self.navigationTitle.titleView = imageView
    }
    
    func setUpScrollView() {
//        adScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: secondView.frame.height * 0.3)
        adScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(adImageNames.count), height: secondView.frame.height * 0.3)
        adScrollView.delegate = self
        adScrollView.alwaysBounceVertical = false
        adScrollView.showsHorizontalScrollIndicator = false
        adScrollView.showsVerticalScrollIndicator = false
        adScrollView.isScrollEnabled = true
        adScrollView.isPagingEnabled = true
        adScrollView.bounces = false
        
        adScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:0).isActive = true
        adScrollView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 0).isActive = true
        adScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        adScrollView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    func setUpPageControl() {
        adPageControl.currentPage = 0
        adPageControl.numberOfPages = adImageNames.count
    }
    
    func imageAdd() {
        for (index, imageName) in adImageNames.enumerated() {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: secondView.frame.height * 0.3)
            imageView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            adScrollView.addSubview(imageView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adPageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }

}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
}

extension CALayer {
    // Sketch 스타일의 그림자를 생성하는 유틸리티 함수
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 5,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있다.
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
