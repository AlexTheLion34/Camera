//
//  StartViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 14.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    private var imageManager: ImageManager { return .manager }
    private var videManager: VideoManager { return .manager }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTextField()
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        startButton.isEnabled = false
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    @IBAction func useButtonPressed(_ sender: UIButton) {
        if ipTextField.text != "" {
            imageManager.recieveIp(recievedIp: ipTextField.text!)
            videManager.recieveIp(recievedIp: ipTextField.text!)
            startButton.isEnabled = true
        }
    }
}

// MARK: - NavigationBar settings
extension StartViewController {
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Colors.barColor.value
        navigationController?.navigationBar.topItem?.title = BarTitles.setup.rawValue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
    }
}

// MARK: - Keyboard settings
extension StartViewController {
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrameSize.height / 2)
    }

    @objc private func keyboardWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
}

// MARK: - TextFiled settings
extension StartViewController: UITextFieldDelegate {
    
    private func setupTextField() {
        ipTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


