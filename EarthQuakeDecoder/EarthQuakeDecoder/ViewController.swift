//
//  ViewController.swift
//  EarthQuakeDecoder
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var earthQuakeInfos: [EarthQuakeInfo.Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataService.shared.request { (earth) in
            self.earthQuakeInfos = earth
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthQuakeInfos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let quakeData = earthQuakeInfos[indexPath.row]
        cell.labelMag.text = String(quakeData.mag!)
        cell.labelFirstname.text = quakeData.firstNamePlace
        cell.labelLastName.text = quakeData.lastNamePalce
        cell.labelDateString.text = quakeData.dateString
        cell.labelTimeString.text = quakeData.timeString
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? WedViewController
        destination?.dataUrl = DataService.shared.urlString
        
    }
    
}

