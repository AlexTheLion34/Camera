//
//  IpValidator.swift
//  Camera
//
//  Created by Alexey Petrenko on 23.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation

class IpValidator {
    
    static let validator = IpValidator()
    
    private let regExpPattern = "^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])$"
    
    func validateIp(ip: String) -> Bool {
        return ip.range(of: regExpPattern, options: .regularExpression) != nil
    }
}


