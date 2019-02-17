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
    
    // hardcoced just for now
    let ip: String = "158.58.130.148"
    var date: String
    var image: UIImage
    
    init(date: String, image: UIImage) {
        self.date = date
        self.image = image
    }
}
