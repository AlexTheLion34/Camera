//
//  VideoViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 08.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit
import Alamofire

class VideoViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
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
    
    @IBAction func sliderDIdSlide(_ sender: UISlider) {
        sender.isContinuous = false
        videManager.zoom(withMultiplier: sender.value)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        videManager.moveInDirection(withId: sender.tag)
    }
}

extension VideoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        checkOrientation()
        setupNavigationBar()
        videoProvider.configurePlayer(withView: videoView)
        // FIXME: remove it later
        request(videManager.zoomURL + "speed=\(100)", method: .get)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.navigationBar.isHidden = true
            bottomConstraint.constant = 210.0
        } else {
            self.navigationController?.navigationBar.isHidden = false
            bottomConstraint.constant = 0.0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        videManager.player.stop()
    }
}
