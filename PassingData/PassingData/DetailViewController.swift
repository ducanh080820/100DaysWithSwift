//
//  DetailViewController.swift
//  PassingData
//
//  Created by Apple on 6/19/19.
//  Copyright © 2019 DucAnh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var dataText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataText != nil {
        myLabel.text = dataText
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
