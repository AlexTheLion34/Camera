//
//  ImageProvider.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageProvider: NSObject {
    
    static let provider = ImageProvider()
    
    var imageManager: ImageManager { return .manager }
}

// MARK: - DataSource
extension ImageProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageManager.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.imageCell.rawValue, for: indexPath) as! ImageTableViewCell
        if (imageManager.images.count != 0) {
            cell.jpgImageView.image = UIImage(data: imageManager.images[indexPath.row].image)
            cell.ipLabel.text = Labels.ip.value + imageManager.images[indexPath.row].ip
            cell.dateLabel.text = Labels.date.value + imageManager.images[indexPath.row].date
        }
        return cell
    }
}

// MARK: - Delegate
extension ImageProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: SaveAlert.title.value, message: SaveAlert.message.value, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: SaveAlert.yesAction.value, style: .default) { (action: UIAlertAction) in
            self.imageManager.saveImage(fromIndex: indexPath.row)
        })
        alertController.addAction(UIAlertAction(title: SaveAlert.noAction.value, style: .default, handler: nil))
        NotificationCenter.default.post(name: NSNotification.Name.init(SaveAlert.notification.value), object: nil, userInfo: [SaveAlert.notification.value: alertController])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

