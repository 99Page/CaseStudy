//
//  SceneDelegate.swift
//  temp
//
//  Created by 노우영 on 2022/07/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var backgroundView: UIView?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let mainTC = MainTabbarController()
        window?.rootViewController = mainTC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        callBackgroundImage(false)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        callBackgroundImage(true)
//        callImage(false)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        callBackgroundImage(false)
//        callImage(false)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        callBackgroundImage(true)
//        callImage(false)
    }
    
    func callBackgroundImage(_ bShow: Bool) {
        let TAG_BG_IMAGE = -101
        backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMAGE)
        
        if bShow {
            if backgroundView == nil {
                let bgView = UIView()
                bgView.frame = UIScreen.main.bounds
                bgView.tag = TAG_BG_IMAGE
                bgView.backgroundColor = UIColor.appColor(.StarBucksGreen)
                let imageView = UIImageView()
                imageView.image = UIImage(named: "BackgroundImage")
                imageView.frame = UIScreen.main.bounds
                bgView.addSubview(imageView)

                window?.rootViewController?.view.window?.addSubview(bgView)
            }
        }
        else {
            if let backgroundView = backgroundView {
                backgroundView.removeFromSuperview()
            }
        }
    }
    
    func callImage() {
        let TAG_BG_IMAGE = -101
        backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMAGE)
        
        if backgroundView == nil {
            let bgView = UIView()
            bgView.frame = UIScreen.main.bounds
            bgView.tag = TAG_BG_IMAGE
            bgView.backgroundColor = UIColor.black
            let imageView = UIImageView()
            imageView.image = UIImage(named: "BackgroundImage")
            imageView.frame = UIScreen.main.bounds
            bgView.addSubview(imageView)
            
            var configuration = UIButton.Configuration.filled()
            configuration.title = "종료하기"
            configuration.baseBackgroundColor = UIColor.appColor(.StarBucksGreen)
            configuration.baseForegroundColor = .white
            configuration.cornerStyle = .capsule
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
            let exitButton = UIButton(configuration: configuration, primaryAction: nil)
            exitButton.translatesAutoresizingMaskIntoConstraints = false
            exitButton.addTarget(self, action: #selector(dismissView), for: .allTouchEvents)
            bgView.addSubview(exitButton)
            NSLayoutConstraint.activate([
                exitButton.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10),
                exitButton.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20)
            ])
            

            window?.rootViewController?.view.window?.addSubview(bgView)
        }
    }
    
    @objc
    func dismissView() {
        guard let bgView = backgroundView else { return }
        bgView.removeFromSuperview()
    }


}

