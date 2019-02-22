//
//  VideoManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 17.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation

class VideoManager: IpReciever {
    
    static let manager = VideoManager()
    
    private var streamURL: String = ""
    public var player: VLCMediaPlayer = VLCMediaPlayer()
    
    func setupMedia() {
        player.media = VLCMedia(url: URL(string: streamURL)!)
    }
    
    public func recieveIp(recievedIp: String) {
        streamURL = "http://" + recievedIp + "/axis-cgi/mjpg/video.cgi"
    }
}
