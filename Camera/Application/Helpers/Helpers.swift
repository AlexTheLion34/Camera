//
//  Styles.swift
//  Camera
//
//  Created by Alexey Petrenko on 21.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation

enum Colors {
    case barColor
    case buttonColor
    case tableViewBackgroundColor
    case imageCellBackgroundColor
    case placeholderErrorColor
}

enum Labels {
    case ip
    case date
}

enum BarTitles {
    case setup
    case images
    case stream
}

enum GalleryImageCellConstants {
    case left
    case right
    case spacing
    case width
    case height
}

enum CellIdentifiers: String {
    case imageCell
    case galleryCollectionCell
}

enum SegueIdentifiers: String {
    case goToTabBar
}

enum SaveAlert {
    case title
    case message
    case yesAction
    case noAction
    case notification
}

enum ApplicationErrors  {
    case invalidIp
    case initNotImplemented
}

