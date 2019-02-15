//
//  VideoViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 08.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, VLCMediaPlayerDelegate {

    @IBOutlet weak var videoView: UIView!
    
    let streamURL = URL(string: "http://158.58.130.148/axis-cgi/mjpg/video.cgi")
    
    private let player: VLCMediaPlayer = VLCMediaPlayer()
    
    private func checkOrientation() {
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupPlayer() {
        let media = VLCMedia(url: streamURL!)
        
        player.media = media
        player.delegate = self
        player.drawable = videoView
        player.play()
    }
}

extension VideoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        checkOrientation()
        setupNavigationBar()
        setupPlayer()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.navigationBar.isHidden = true
        } else {
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
}
