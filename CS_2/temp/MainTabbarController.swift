////
////  MainTabbarController.swift
////  temp
////
////  Created by 노우영 on 2022/07/06.
////
//
//import UIKit
//
//class MainTabbarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("MainTabbarController viewDidLoad() called")
//    }
//    
//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = .green
//        viewControllers = [UIViewController]()
//        view.backgroundColor = UIColor.white
//
//        //Add a custom view with red color
//        let firstNC = UINavigationController.init(rootViewController: HomeViewController(title: "Home"))
//        let secondNC = UINavigationController.init(rootViewController: HomeViewController(title: "Pay"))
//        let thirdNC = UINavigationController.init(rootViewController: HomeViewController(title: "Order"))
//        let fourthNC = UINavigationController.init(rootViewController: HomeViewController(title: "Gift"))
//        let fifthNC = UINavigationController.init(rootViewController: HomeViewController(title: "Other"))
//
//        self.viewControllers = [firstNC, secondNC, thirdNC, fourthNC, fifthNC]
//
//        let firstTabbarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//        let secondTabbarItem = UITabBarItem(title: "Pay", image: UIImage(systemName: "creditcard"), tag: 1)
//        let thirdTabbarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "cup.and.saucer"), tag: 2)
//        let fourthTabbarItem = UITabBarItem(title: "Gift", image: UIImage(systemName: "gift"), tag: 3)
//        let fifthTabbarItem = UITabBarItem(title: "Other", image: UIImage(systemName: "list.dash"), tag: 4)
//
//        firstNC.tabBarItem = firstTabbarItem
//        secondNC.tabBarItem = secondTabbarItem
//        thirdNC.tabBarItem = thirdTabbarItem
//        fourthNC.tabBarItem = fourthTabbarItem
//        fifthNC.tabBarItem = fifthTabbarItem
//        
//
//    }
//}
