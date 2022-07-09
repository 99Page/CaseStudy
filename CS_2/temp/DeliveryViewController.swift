//
//  DeliveryViewController.swift
//  temp
//
//  Created by 노우영 on 2022/07/09.
//

import UIKit
class DeliveryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    @objc
    func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
