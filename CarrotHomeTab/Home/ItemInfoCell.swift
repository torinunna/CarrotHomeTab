//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by YUJIN KWON on 2022/10/07.
//

import UIKit

class ItemInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var numOfChatsLabel: UILabel!
    @IBOutlet weak var numOfLikesLabel: UILabel!
    
    func configure(item: ItemInfo) {
        titleLabel.text = item.title
        descriptionLabel.text = item.location
        priceLabel.text = "\(item.price)원"
        
        numOfChatsLabel.text = "\(item.numOfChats)원"
        numOfLikesLabel.text = "\(item.numOfLikes)"
    }

}
