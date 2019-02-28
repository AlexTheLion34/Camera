//
//  VideoManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 17.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation
import Alamofire

class VideoManager: IpReciever {
    
    static let manager = VideoManager()
    
    private var streamURL: String = ""
    public var zoomURL: String = ""
    public var player: VLCMediaPlayer = VLCMediaPlayer()
    
    func setupMedia() {
        player.media = VLCMedia(url: URL(string: streamURL)!)
    }
    
    public func recieveIp(recievedIp: String) {
        streamURL = "http://" + recievedIp + "/axis-cgi/mjpg/video.cgi"
        zoomURL = "http://" + recievedIp + "/axis-cgi/com/ptz.cgi?"
    }
    
    public func moveInDirection(withId id: Int) {
        switch id {
        case 1:
            request(zoomURL + "move=up", method: .get)
        case 2:
            request(zoomURL + "move=right", method: .get)
        case 3:
            request(zoomURL + "move=down", method: .get)
        default:
            request(zoomURL + "move=left", method: .get)
        }
    }
    
    public func zoom(withMultiplier multiplier: Float) {
        request(zoomURL + "zoom=\(multiplier)", method: .get)
    }
}
