//
//  ViewController.swift
//  GetAPIResponesitory
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController:  UITableViewController {
    //    var arrayInt = [Int](1...10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.share.getData { (data) in
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return arrayInt.count
        return DataService.share.entities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //        cell?.nameText?.text = DataService.share.entities[indexPath.row].name
        //        cell?.fullNameLabel?.text = DataService.share.entities[indexPath.row].full_name
        cell.textLabel?.text = DataService.share.entities[indexPath.row].name
//        cell.textLabel?.text = String(DataService.share.entities[indexPath.row].id)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // neu have next link to download
        guard DataService.share.entities.count != 0 else {
            return
        }
        // when indexPath loaded 9/10 when you download the file when loading the load load
        if indexPath.row == Int(Double(DataService.share.entities.count)*0.9) {
            DataService.share.loadMore(completedHandle: {[unowned self] (_) in
                self.tableView.reloadData()
            })
        }
    }
    
    
}

