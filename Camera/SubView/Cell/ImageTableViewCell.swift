//
//  ImageCellTableViewCell.swift
//  Camera
//
//  Created by Alexey Petrenko on 08.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIView!
    
    @IBOutlet weak var jpgImageView: UIImageView!
    
    @IBOutlet weak var ipLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardImageView.layer.cornerRadius = 3.0
        cardImageView.layer.masksToBounds = false
        cardImageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        cardImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardImageView.layer.shadowOpacity = 0.8
    }
}
