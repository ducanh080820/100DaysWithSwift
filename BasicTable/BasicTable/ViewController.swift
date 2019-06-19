//
//  ViewController.swift
//  BasicTable
//
//  Created by Tranducanh on 6/19/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var arrData = ["milk", "apples", "ham", "eggs", "pancakes", "cereal"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}

