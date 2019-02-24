//
//  Extensions.swift
//  Camera
//
//  Created by Alexey Petrenko on 21.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation

extension Colors {
    var value: UIColor {
        get {
            switch self {
            case .barColor:
                return UIColor(displayP3Red: 63 / 255, green: 136 / 255, blue: 143 / 255, alpha: 1)
            case .buttonColor:
                return UIColor(displayP3Red: 77 / 255, green: 113 / 255, blue: 152 / 255, alpha: 1)
            case .tableViewBackgroundColor:
                return UIColor(displayP3Red: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1)
            case .imageCellBackgroundColor:
                return UIColor.black.withAlphaComponent(0.2)
            case .placeholderErrorColor:
                return UIColor(displayP3Red: 255 / 255.0, green: 128 / 255.0, blue: 128 / 255.0, alpha: 1)
            }
        }
    }
}

extension Labels {
    var value: String {
        get {
            switch self {
            case .date:
                return "Date/Time: "
            case .ip:
                return "IP: "
            }
        }
    }
}

extension BarTitles {
    var value: String {
        get {
            switch self {
            case .setup:
                return "Setup"
            case .images:
                return "Images"
            case .stream:
                return "Stream"
            }
        }
    }
}

extension SaveAlert {
    var value: String {
        get {
            switch self {
            case .title:
                return "Save image"
            case .message:
                return "Would you like to save this image?"
            case .yesAction:
                return "Yes"
            case .noAction:
                return "No"
            case .notification:
                return "alert"
            }
        }
    }
}

extension ApplicationErrors {
    var value: String {
        get {
            switch self {
            case .invalidIp:
                return "Invalid IP!"
            case .initNotImplemented:
                return "init(coder:) has not been implemented"
            }
        }
    }
}

