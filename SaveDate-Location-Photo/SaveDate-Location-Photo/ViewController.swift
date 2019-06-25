//
//  ViewController.swift
//  SaveDate-Location-Photo
//
//  Created by DSCO on 6/25/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModeViewControlDelegate {
   
    
    
    var groups = [
        [
            "id": "001",
            "date": "2015-10-1 10:01",
            "ico": "icon-1.jpg",
            "note": "😄呵呵呵",
            "location": "銀河系偏遠地區太陽系中的第三顆行星地球村亞洲東部"
        ], [
            "id": "002",
            "date": "2015-10-1 10:01",
            "ico": "icon-2.jpg",
            "note": "╮(╯_╰)╭ ",
            "location": "銀河系偏遠地區太陽系中的第三顆行星地球村亞洲東部"
        ]
    ]
    
    let groupTitles = ["2016"]
    
    func changeData(user: [String: String]){
        self.groups.append(user)
        tableView.reloadData()
    }
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Timeline"
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 142/255, green: 189/255, blue: 131/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 228/255, green: 252/255, blue: 222/255, alpha: 1)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        //创建一个重用的单元格
        tableView!.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        self.view.addSubview(tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = groups[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.dateLable.text = item["date"]
        cell.noteLable.text = item["note"]
        cell.locationLable.text = item["location"]
        let image = UIImage(named: item["ico"] ?? "");
        cell.iconImageView.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupTitles[section]
    }
    @objc func addAction() {
        let nextVC = AddViewController()
        // 指定代理
        nextVC.delegate = self
        navigationController!.pushViewController(nextVC, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

