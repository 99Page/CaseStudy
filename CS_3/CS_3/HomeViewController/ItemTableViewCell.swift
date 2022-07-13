//
//  ItemTableViewCell.swift
//  CS_3
//
//  Created by 노우영 on 2022/07/13.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let identifier = "ItemTableViewCell"
    
    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    let itemImage: UIImageView = {
        let itemImage = UIImageView()
        itemImage.image = UIImage(systemName: "pencil")
        return itemImage
    }()
    
    let info: UILabel = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.font = UIFont.systemFont(ofSize: 13)
        info.textColor = .white
        return info
    }()
    
    let price: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        price.textColor = .white
        return price
    }()
    
    let likeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .white
        let likeButton = UIButton(configuration: configuration, primaryAction: nil)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        return likeButton
    }()
    
    let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 13)
        likesLabel.textColor = .white
        return likesLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .DarkBackground
        contentView.addSubview(itemImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(info)
        contentView.addSubview(price)
        contentView.addSubview(likeButton)
        contentView.addSubview(likesLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let baseWidth = UIScreen.main.bounds.size.width
        let baseHeight = UIScreen.main.bounds.size.height
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImage.widthAnchor.constraint(equalTo: baseWidth, multiplier: 0.15),
            itemImage.heightAnchor.constraint(equalTo: baseHeight, multiplier: 0.25),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10)
        ])
    }

}
