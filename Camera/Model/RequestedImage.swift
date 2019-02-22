//
//  Image.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

// implement it later
//import RealmSwift

class RequestedImage {
    
    let ip: String
    var date: String
    var image: UIImage
    
    init(ip: String, date: String, image: UIImage) {
        self.ip = ip
        self.date = date
        self.image = image
    }
}
