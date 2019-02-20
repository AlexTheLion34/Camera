//
//  CustomButton.swift
//  Camera
//
//  Created by Alexey Petrenko on 21.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = Colors.buttonColor.value
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.8
    }
}
