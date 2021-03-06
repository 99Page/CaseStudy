//
//  DeliveryViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/09.
//

import UIKit
class DeliveryViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.hidesBackButton = false
    }
    
    @objc
    func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
