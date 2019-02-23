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
    
    @objc private func addButtonPressed() {
        imageManager.addImage()
        self.tableView.reloadData()
    }
    
    @objc private func showAllert(notification: Notification) {
        guard let userinfo = notification.userInfo else { return }
        let alertController = userinfo["alert"] as! UIAlertController
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ImageTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = imageProvider
        self.tableView.delegate = imageProvider
        configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(showAllert(notification:)), name: NSNotification.Name.init(SaveAlert.notification.rawValue), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = nil
    }
}


