//
//  TableViewController.swift
//  Contacts
//
//  Created by Tranducanh on 6/20/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var indexOfSelectedPerson = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionFooterHeight = 0
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0/255, green: 119/255, blue: 204/255, alpha: 1)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return recent.count
        case 1:
            return firends.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = recent[indexPath.row]["name"]
            cell.imageView?.image = UIImage(named: recent[indexPath.row]["avatar"]!)
            break
        case 1:
            cell.textLabel!.text = firends[indexPath.row]["name"]
            cell.imageView?.image = UIImage(named: firends[indexPath.row]["avatar"]!)
            break
        default:
            break
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Recent"
        case 1:
            return "Firends"
        default:
            return ""
        }
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ViewController
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)
        switch indexPath!.section {
        case 0:
            controller!.selectedValue = recent[indexPath!.row]
            break
        case 1:
            controller!.selectedValue = firends[indexPath!.row]
            break
        default:
            break
        }
    }

}
