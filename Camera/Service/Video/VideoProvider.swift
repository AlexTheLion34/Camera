//
//  VideoProvider.swift
//  Camera
//
//  Created by Alexey Petrenko on 17.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class VideoProvider: NSObject {
    
    static let provider = VideoProvider()
    
    var videoManger: VideoManager { return .manager}
    
}

extension VideoProvider: VLCMediaPlayerDelegate  {
    
    func configurePlayer(withView view: UIView) {
        videoManger.setupMedia()
        videoManger.player.delegate = self
        videoManger.player.drawable = view
        videoManger.player.play()
    }
}
