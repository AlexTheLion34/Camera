//
//  VideoViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 08.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
    private var videoProvider: VideoProvider { return .provider }
    private var videManager: VideoManager { return .manager }
    
    private func checkOrientation() {
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
    }
}

extension VideoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        checkOrientation()
        setupNavigationBar()
        videoProvider.configurePlayer(withView: videoView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.navigationBar.isHidden = true
        } else {
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        videManager.player.stop()
    }
}
