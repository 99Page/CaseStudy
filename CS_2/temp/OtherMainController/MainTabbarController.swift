//
//  MainTabbarController.swift
//  temp
//
//  Created by 노우영 on 2022/07/06.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.appColor(.StarBucksGreen)
        self.tabBarController?.navigationItem.titleView?.removeFromSuperview()
        self.tabBarController?.navigationItem.title?.removeAll()
        
        let vc1 = HomeViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        let firstTabbarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        nav1.tabBarItem = firstTabbarItem
        nav1.navigationBar.prefersLargeTitles = false
        
        let vc2 = PayViewController()
        let nav2 = UINavigationController(rootViewController: vc2)
        let secondTabbarItem =  UITabBarItem(title: "Pay", image: UIImage(systemName: "creditcard"), tag: 1)
        nav2.tabBarItem = secondTabbarItem
        nav2.navigationBar.prefersLargeTitles = true
        
        let vc3 = OrderViewController()
        let nav3 = UINavigationController(rootViewController: vc3)
        let thirdTabbarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "cup.and.saucer"), tag: 2)
        nav3.tabBarItem = thirdTabbarItem
        nav3.navigationBar.prefersLargeTitles = true
        
        let vc4 = GiftViewController()
        let nav4 = UINavigationController(rootViewController: vc4)
        let fourthTabbarItem = UITabBarItem(title: "Gift", image: UIImage(systemName: "gift"), tag: 3)
        nav4.tabBarItem = fourthTabbarItem
        nav4.navigationBar.prefersLargeTitles = true
        
        let vc5 = OtherViewController()
        let nav5 = UINavigationController(rootViewController: vc5)
        let fifthTabbarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "list.dash"), tag: 4)
        nav5.tabBarItem = fifthTabbarItem
        nav5.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
        
    }
}
