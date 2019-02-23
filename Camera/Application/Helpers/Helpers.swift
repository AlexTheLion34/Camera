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

enum Labels: String {
    case ip = "IP: "
    case date = "Date/Time: "
}

enum BarTitles: String {
    case setup = "Setup"
    case images = "Images"
    case stream = "Stream"
}

enum CellIdentifiers: String {
    case imageCell
}

enum SegueIdentifiers: String {
    case goToTabBar
}

enum ApplicationErrors: String {
    case invalidIp = "Invalid IP!"
}

