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
        // This is the only methods you need to implement
        self.tableView.customRefresh {
            // You can do your API call here
            print("Refreshing")
            self.toggle()
        }
        self.tableView.customReload {
            // You can do your API call here
            print("Reloading")
            self.toggle()
        }
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

