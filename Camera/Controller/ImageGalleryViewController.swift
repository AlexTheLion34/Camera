//
//  ImageGalleryViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 24.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController {
    
    private var galleryCollectionView = GalleryCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(galleryCollectionView)
        setupConstraints()
    }
    
    public static func storyboardInstance() -> ImageGalleryViewController? {
        let storyboard = UIStoryboard(name: "ImageGallery", bundle: nil)
        return storyboard.instantiateInitialViewController() as? ImageGalleryViewController
    }
    
    private func setupConstraints() {
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
