//
//  ImageManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageManager: IpReciever {
    
    static let manager = ImageManager()
    
    private var url: String = ""
    private var ip: String = ""
    
    public var images = [RequestedImage]()
    
    // try to solve it with AlamofireImage later
    public func addImage() {
        guard let data = try? Data(contentsOf: URL(string: url)!) else {
            return

        }
        guard let image = UIImage(data: data) else {
            return
        }
        images.append(RequestedImage(ip: ip, date: calculateDate(), image: image))
    }
    
    private func calculateDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: currentDate)
    }
    
    public func recieveIp(recievedIp: String) {
        ip = recievedIp
        url = "http://" + ip + "/jpg/image.jpg"
    }
}
