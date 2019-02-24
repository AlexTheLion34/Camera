//
//  ImageManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit
import RealmSwift

class ImageManager: IpReciever {
    
    static let manager = ImageManager()
    
    private var realm = try! Realm()
    
    private var url: String = ""
    private var ip: String = ""
    
    public var images = [RequestedImage]()
    
    // FIXME: add timeout if there isnt any response and show alert with error
    public func addImage() {
        guard let data = try? Data(contentsOf: URL(string: url)!) else {
            return
        }
        guard let image = UIImage(data: data) else {
            return
        }
        images.append(RequestedImage(ip: ip, date: calculateDate(), image: image))
    }
    
    public func saveImage(fromIndex index: Int) {
        try! realm.write {
            realm.add(images[index])
        }
    }
    // TODO: Need to rewrite later
    public func retrieveImages() -> [RequestedImage] {
        let retrievedImages = realm.objects(RequestedImage.self)
        var result = [RequestedImage]()
        for image in retrievedImages {
            result.append(image)
        }
        return result
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
