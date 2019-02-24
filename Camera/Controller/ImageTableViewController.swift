//
//  ImageTableViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 16.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {
    
    private var imageProvider: ImageProvider { return .provider }
    private var imageManager: ImageManager { return .manager }
    
    private func configureTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = Colors.tableViewBackgroundColor.value
    }
    
    private func setupNavigationItem() {
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let viewGalleryitem = UIBarButtonItem(image: UIImage(named: "gallery"), style: .done, target: self, action: #selector(showGallery))
        navigationController?.topViewController?.navigationItem.rightBarButtonItems = [viewGalleryitem, addItem]
        navigationController?.topViewController?.navigationItem.title = BarTitles.images.value
    }
    
    @objc private func addButtonPressed() {
        imageManager.addImage()
        self.tableView.reloadData()
    }
    
    @objc private func showAllert(notification: Notification) {
        guard let userinfo = notification.userInfo else { return }
        let alertController = userinfo[SaveAlert.notification.value] as! UIAlertController
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func showGallery() {
        let galleryViewController = ImageGalleryViewController.storyboardInstance()
        navigationController?.pushViewController(galleryViewController!, animated: true)
    }
}

extension ImageTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = imageProvider
        self.tableView.delegate = imageProvider
        configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(showAllert(notification:)), name: NSNotification.Name.init(SaveAlert.notification.value), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.topViewController?.navigationItem.rightBarButtonItems = nil
    }
}


