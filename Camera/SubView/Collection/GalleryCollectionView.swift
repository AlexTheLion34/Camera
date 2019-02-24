//
//  GalleryCollectionView.swift
//  Camera
//
//  Created by Alexey Petrenko on 24.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(ApplicationErrors.initNotImplemented.value)
    }
}
