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
    private var ipValidator: IpValidator { return .validator }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        registerForKeyboardNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == SegueIdentifiers.goToTabBar.rawValue {
            if ipValidator.validateIp(ip: ipTextField.text!) {
                imageManager.recieveIp(recievedIp: ipTextField.text!)
                videManager.recieveIp(recievedIp: ipTextField.text!)
                return true
            } else {
                ipTextField.text = ""
                ipTextField.attributedPlaceholder = NSAttributedString(string: ApplicationErrors.invalidIp.value, attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholderErrorColor.value])
                return false
            }
        }
        return false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = nil
    }
}

// MARK: - NavigationBar settings
extension StartViewController {
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Colors.barColor.value
        navigationController?.navigationBar.topItem?.title = BarTitles.setup.value
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        let viewGalleryitem = UIBarButtonItem(image: UIImage(named: "gallery"), style: .done, target: self, action: #selector(showGallery))
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = viewGalleryitem
    }
    
    @objc private func showGallery() {
        guard let galleryViewController = ImageGalleryViewController.storyboardInstance() else { return }
        navigationController?.pushViewController(galleryViewController, animated: true)
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ipTextField.placeholder = ""
    }
}


