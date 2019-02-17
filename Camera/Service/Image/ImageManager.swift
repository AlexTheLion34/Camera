//
//  ImageManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageManager {
    
    static let manager = ImageManager()
    
    private let url = URL(string: "http://158.58.130.148/jpg/image.jpg")
    
    public var images = [RequestedImage]()
    
    // try to solve it with AlamofireImage later
    public func addImage() {
        guard let data = try? Data(contentsOf: url!) else {
            return
            
        }
        guard let image = UIImage(data: data) else {
            return
        }
        images.append(RequestedImage(date: calculateDate(), image: image))
    }
    
    private func calculateDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: currentDate)
    }
}
