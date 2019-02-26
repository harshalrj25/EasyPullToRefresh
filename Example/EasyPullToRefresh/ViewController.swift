//
//  ViewController.swift
//  EasyPullToRefresh
//
//  Created by harshalrj25 on 02/26/2019.
//  Copyright (c) 2019 harshalrj25. All rights reserved.
//

import UIKit
import EasyPullToRefresh

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var count = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use this handler for pull to refresh event
        self.tableView.customRefresh {
            // You can do your API call here
            print("Refreshing")
            self.toggle()
        }
        
        // Use this handler when tableview is empty and reload button is clicked
        self.tableView.customReload {
            // You can do your API call here
            print("Reloading")
            self.toggle()
        }
        
//        1: Disable pull to refresh using the flag
//        self.tableView.showPullToRefresh = false
//
//        2: Disable empty tableview message and reload button
//        self.tableView.showReloadOnEmpty = false
//
//        3: Customize the UiRefreshControl
//        self.tableView.customRefreshControl.backgroundColor = UIColor.green
//        self.tableView.customRefreshControl.tintColor = UIColor.green
//
//        4: Override custom message for empty tableview using below label
//        self.tableView.customEmptyMessageLabel.text = "YOUR CUSTOM TEXT FOR EMPTY LIST"
//
//        5: Customize the Reload button for empty tableview
//            self.tableView.customReloadButton.backgroundColor = UIColor.green
//        self.tableView.customReloadButton.layer.borderColor = UIColor.red.cgColor
    }
    
    func toggle() {
        if count == 20{
            count = 0
        }else{
            count = 20
        }
        self.tableView.reloadData()
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "My row number is \(indexPath.row)"
        cell.detailTextLabel?.text = "My Details for the row number \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

