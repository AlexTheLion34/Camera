//
//  GalleryCollectionView.swift
//  Camera
//
//  Created by Alexey Petrenko on 24.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

// TODO: Add date and ip to gallery, implement deleting images from db and saving to camera roll
class GalleryCollectionView: UICollectionView {
    
    private var galleryImageProvider: GalleryImageProvider { return .provider }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = galleryImageProvider
        dataSource = galleryImageProvider
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.galleryCollectionCell.rawValue)
        translatesAutoresizingMaskIntoConstraints = false
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        contentInset = UIEdgeInsets(top: 0, left: GalleryImageCellConstants.left.value, bottom: 0, right: GalleryImageCellConstants.right.value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(ApplicationErrors.initNotImplemented.value)
    }
}
