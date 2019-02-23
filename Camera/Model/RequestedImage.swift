//
//  Image.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import RealmSwift

class RequestedImage: Object {
    
    @objc dynamic var ip: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var image: Data = Data()
    
    required convenience init(ip: String, date: String, image: UIImage) {
        self.init()
        self.ip = ip
        self.date = date
        self.image = image.jpegData(compressionQuality: 0.9)!
    }
}
