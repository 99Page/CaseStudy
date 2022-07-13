//
//  TabbarController.swift
//  CS_3
//
//  Created by 노우영 on 2022/07/13.
//

import UIKit

class TabbarControlelr: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor.DarkBackground
        self.tabBar.unselectedItemTintColor = UIColor.white
        
        let vc1 = HomeViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        let tabBarItem1 = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        nav1.tabBarItem = tabBarItem1
        nav1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let vc2 = TownViewController()
        let nav2 = UINavigationController(rootViewController: vc2)
        let tabBarItem2 = UITabBarItem(title: "동네 생활", image: UIImage(systemName: "newspaper"), tag: 1)
        nav2.tabBarItem = tabBarItem2
        nav2.tabBarItem.selectedImage = UIImage(systemName: "newspaper.fill")
        
        let vc3 = NearMeViewController()
        let nav3 = UINavigationController(rootViewController: vc3)
        let tabBarItem3 = UITabBarItem(title: "내 근처", image: UIImage(systemName: "pin.square"), tag: 2)
        nav3.tabBarItem = tabBarItem3
        nav3.tabBarItem.selectedImage = UIImage(systemName: "pin.square.fill")
        
        let vc4 = ChatViewController()
        let nav4 = UINavigationController(rootViewController: vc4)
        let tabBarItem4 = UITabBarItem(title: "채팅", image: UIImage(systemName: "bubble.left.and.bubble.right"), tag: 3)
        nav4.tabBarItem = tabBarItem4
        nav4.tabBarItem.selectedImage = UIImage(systemName: "bubble.left.and.bubble.right.fill")
        
        let vc5 = MyCarrotViewController()
        let nav5 = UINavigationController(rootViewController: vc5)
        let tabBarItem5 = UITabBarItem(title: "나의 당근", image: UIImage(systemName: "person"), tag: 5)
        nav5.tabBarItem = tabBarItem5
        nav5.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        

        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
        
    }
}
