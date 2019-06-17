//
//  ViewController.swift
//  Sample1
//
//  Created by duc anh on 6/17/19.
//  Copyright © 2019 duc anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myBtnCount: UIButton!
    
    var start = 1
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionCount(_ sender: UIButton) {
           myLabel.text = "\(start)"
            start += 1
    }
    
    @IBAction func actionBtnReset(_ sender: UIBarButtonItem) {
       myLabel.text = "\(0)"
        start = 1
    }
    
}

