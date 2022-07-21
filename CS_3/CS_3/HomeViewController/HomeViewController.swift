//
//  ViewController.swift
//  CS_3
//
//  Created by 노우영 on 2022/07/13.
//

import UIKit

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.view.backgroundColor = UIColor.DarkBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.DarkBackground
        self.navigationController?.navigationBar.tintColor = UIColor.DarkBackground
        
        view.backgroundColor = UIColor.DarkBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(plusBdge)
        NSLayoutConstraint.activate([
            plusBdge.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            plusBdge.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            plusBdge.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            plusBdge.widthAnchor.constraint(equalTo: plusBdge.heightAnchor)
        ])
        
        // Do any additional setup after loading the view.
    }
        
    let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.DarkBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
        tableView.rowHeight = UIScreen.main.bounds.height * 0.15
        
        return tableView
    }()
    
    let plusBdge: UIImageView = {
        let plusBadge = UIImageView()
        plusBadge.translatesAutoresizingMaskIntoConstraints = false
        plusBadge.image = UIImage(systemName: "plus.circle.fill")?.withTintColor(UIColor.Orange ?? UIColor.white, renderingMode: .alwaysOriginal)
        plusBadge.contentMode = .scaleAspectFit
        return plusBadge
    }()
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as! ItemTableViewCell
        
        cell.itemImage.image = UIImage(named: dummyData[indexPath.row].imageName)
        cell.titleLabel.text = dummyData[indexPath.row].title
        cell.info.text = dummyData[indexPath.row].locationAndTime
        cell.price.text = priceString(price: dummyData[indexPath.row].price)
        cell.likesLabel.text = String(dummyData[indexPath.row].likes)
        cell.chatsLabel.text = String(dummyData[indexPath.row].chats)
        
        return cell
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
}

func priceString(price: Int) -> String {
    
    var tmp = price
    if (tmp >= 1000000) {
        tmp /= 10000
        return String(tmp) + "만원"
    }
    
    let formmater = NumberFormatter()
    formmater.numberStyle = .decimal
    return formmater.string(from: NSNumber(value: price))! + "원"
}
