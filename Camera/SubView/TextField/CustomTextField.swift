//
//  CustomTextField.swift
//  Camera
//
//  Created by Alexey Petrenko on 22.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.buttonColor.value.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
    }

}
