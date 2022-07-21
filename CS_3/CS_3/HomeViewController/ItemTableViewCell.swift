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
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.image = UIImage(systemName: "pencil")
        
        itemImage.clipsToBounds = true
        itemImage.layer.cornerRadius = 15
        return itemImage
    }()
    
    let info: UILabel = {
        let info = UILabel()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.font = UIFont.systemFont(ofSize: 13)
        info.textColor = .gray
        info.text = "우만1동 * 5분 전"
        return info
    }()
    
    let price: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        price.textColor = .white
        price.text = "18,000"
        return price
    }()
    
    let likeImage: UIImageView = {
        let likeImage = UIImageView()
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.image = UIImage(systemName: "heart")
        likeImage.tintColor = .gray
        return likeImage
    }()
    
    let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 15)
        likesLabel.textColor = .gray
        likesLabel.text = "2"
        return likesLabel
    }()
    
    let chatsLabel: UILabel = {
        let chatsLabel = UILabel()
        chatsLabel.translatesAutoresizingMaskIntoConstraints = false
        chatsLabel.font = UIFont.systemFont(ofSize: 15)
        chatsLabel.textColor = .gray
        chatsLabel.text = "1"
        return chatsLabel
    }()
    
    let chatImage: UIImageView = {
        let chatImage = UIImageView()
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatImage.image = UIImage(systemName: "bubble.left.and.bubble.right")
        chatImage.tintColor = .gray
        return chatImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .DarkBackground
        contentView.addSubview(itemImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(info)
        contentView.addSubview(price)
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
        
        if (Int(likesLabel.text!) ?? 0 > 0) {
            contentView.addSubview(likesLabel)
            contentView.addSubview(likeImage)
        }
        
        if (Int(chatsLabel.text!) ?? 0 > 0) {
            contentView.addSubview(chatsLabel)
            contentView.addSubview(chatImage)
        }
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -10),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10),
            info.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            info.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            price.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            price.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 10),
        ])
        
        
        if (Int(likesLabel.text!) ?? 0 > 0) {
            NSLayoutConstraint.activate([
                likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                likeImage.topAnchor.constraint(equalTo: likesLabel.topAnchor, constant: 5),
                likeImage.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant:  -5),
                likeImage.trailingAnchor.constraint(equalTo: likesLabel.leadingAnchor),
            ])
            
            if (Int(chatsLabel.text!) ?? 0 > 0) {
                NSLayoutConstraint.activate([
                    chatsLabel.trailingAnchor.constraint(equalTo: likeImage.leadingAnchor, constant: -5),
                    chatsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
                    chatsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor),
                    chatImage.trailingAnchor.constraint(equalTo: chatsLabel.leadingAnchor),
                    chatImage.topAnchor.constraint(equalTo: likeImage.topAnchor),
                    chatImage.bottomAnchor.constraint(equalTo: likeImage.bottomAnchor)
                ])
            }
        } else {
            if (Int(chatsLabel.text!) ?? 0 > 0) {
                NSLayoutConstraint.activate([
                    chatsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                    chatsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    chatImage.topAnchor.constraint(equalTo: chatsLabel.topAnchor, constant: 5),
                    chatImage.bottomAnchor.constraint(equalTo: chatsLabel.bottomAnchor, constant:  -5),
                    chatImage.trailingAnchor.constraint(equalTo: chatsLabel.leadingAnchor),
                ])
            }
        }
    }

}
