//
//  ViewController.swift
//  CollapsibleTableSection
//
//  Created by DSCO on 7/2/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    struct Section {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        
        //MARK: Constructor
        init(name: String, items: [String]) {
            self.name = name
            self.items = items
            self.collapsed = false
        }
    }
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Data
        sections = [
            Section(name: "Farrari", items: ["LaFerrari", "Enzo", "F40", "F50", "288GTO", "FXX K","FXX"]),
            Section(name: "Lamborghini", items: ["Aventador", "Reventon", "Huracan", "Gallardo", "Sesto Elemento", "Veneno", "Centenario", "Diablo"]),
            Section(name: "Aston Martin", items: ["One-77", "Vanquish", "Vulcan", "Vantage", "Rapide", "DBS", "DB11"]),
            Section(name: "Porsche", items: ["918 Spyder", "Cayenne", "Macan", "911 Turbo S", "Panamera", "Carrera GT"])
        ]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (sections[section].collapsed == true) {
            return 0
        } else {
            return sections[section].items.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! TableViewCell
        
        header.unfoldButton.tag = section
        header.brandLabel.text = sections[section].name
        header.unfoldButton.rotate(sections[section].collapsed! ? 0.0 : CGFloat(Double.pi / 2))
        
        return header.contentView
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
    
    //MARK: Add action
    @IBAction func unfoldButtonDidTouch(_ sender: AnyObject) {
        
        let section = sender.tag
        let collapsed = sections[section!].collapsed
        
        //MARK: Change stage when click
        sections[section!].collapsed = !collapsed!
        
        //MARK: Data overload section
        tableView.reloadSections(IndexSet(integer: section!), with: .automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: Extension
extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = duration
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        //        if let delegate: AnyObject = completionDelegate {
        //            rotateAnimation.delegate = delegate
        //        }
        self.layer.add(rotateAnimation, forKey: nil)
    }


}

