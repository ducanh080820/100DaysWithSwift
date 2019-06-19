//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by Tranducanh on 6/19/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrData = ["egg", "apple", "milk", "ham"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(TableViewController.refresh), for: UIControl.Event.valueChanged)

        
    }

    @objc func refresh() {
        // Updating your data here...
        arrData += arrData
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrData[indexPath.row]
        return cell
    }

}
