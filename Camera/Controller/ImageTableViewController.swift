//
//  ImageTableViewController.swift
//  Camera
//
//  Created by Alexey Petrenko on 08.02.2019.
//  Copyright © 2019 Alexey Petrenko. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ImageTableViewController: UITableViewController {
    
    private var currentDate: Date = Date()
    private var dates = [String]()
    private var url = "http://content.foto.my.mail.ru/mail/natashka/_myphoto/s-1.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        cell.dateLabel.text = dates[indexPath.row]
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                cell.jpgImageView.image = image
            }
        }
        return cell
    }
    
    @IBAction func getButtonPressed(_ sender: UIButton) {
        dates.append("Date/Time: " + calaulateCurrentDate())
        tableView.reloadData()
    }
    
    private func calaulateCurrentDate() -> String {
        currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
}
