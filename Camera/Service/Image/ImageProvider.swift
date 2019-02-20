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

//MARK: - DataSource
extension ImageProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageManager.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.imageCell.rawValue, for: indexPath) as! ImageTableViewCell
        if (imageManager.images.count != 0) {
            cell.jpgImageView.image = imageManager.images[indexPath.row].image
            cell.ipLabel.text = Labels.ip.rawValue + imageManager.images[indexPath.row].ip
            cell.dateLabel.text = Labels.date.rawValue + imageManager.images[indexPath.row].date
        }
        return cell
    }
}

extension ImageProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

