//
//  GalleryImageProvider.swift
//  Camera
//
//  Created by Alexey Petrenko on 24.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class GalleryImageProvider: NSObject {
    
    static let provider = GalleryImageProvider()
    
    var imageManager: ImageManager { return .manager }
}

// MARK: - DataSource
extension GalleryImageProvider: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageManager.retrieveImages().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.galleryCollectionCell.rawValue, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = UIImage(data: imageManager.retrieveImages()[indexPath.row].image)
        return cell
    }
}

// MARK: - DelegateFlowLayout
extension GalleryImageProvider: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 347, height: 224)
    }
}
