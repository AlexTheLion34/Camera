//
//  VideoManager.swift
//  Camera
//
//  Created by Alexey Petrenko on 17.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import Foundation

class VideoManager {
    
    static let manager = VideoManager()
    
    private let streamURL = URL(string: "http://158.58.130.148/axis-cgi/mjpg/video.cgi")
    public var player: VLCMediaPlayer = VLCMediaPlayer()
    
    func setupMedia() {
        player.media = VLCMedia(url: streamURL!)
    }
}
