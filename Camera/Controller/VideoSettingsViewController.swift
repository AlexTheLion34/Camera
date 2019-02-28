//
//  VideoSettingsViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 28.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class VideoSettingsViewController: UIViewController {
    
    @IBOutlet weak var speedZoomPickerView: UIPickerView!
    
    private var videoManager: VideoManager { return .manager }
    
    private let zoomSpeedRange = ["1", "25", "50", "75", "100"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedZoomPickerView.delegate = self
        speedZoomPickerView.dataSource = self
    }
}

extension VideoSettingsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return zoomSpeedRange.count
    }
}

extension VideoSettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return zoomSpeedRange[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        videoManager.setupSpeed(withSpeed: zoomSpeedRange[row])
    }
}
