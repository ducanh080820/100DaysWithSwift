//
//  PopoverViewController.swift
//  PopoverMenu
//
//  Created by DSCO on 6/28/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data: [MenuItem] = [
        MenuItem(picture: "1", name: "Start"),
        MenuItem(picture: "2", name: "Add Friend"),
        MenuItem(picture: "3", name: "Scan"),
        MenuItem(picture: "4", name: "Pay")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PopoverMenuTableViewCell
        
        cell.menuImage.image = UIImage(named: data[indexPath.row].picture)
        cell.menuName.setTitle(data[indexPath.row].name, for: UIControl.State())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
