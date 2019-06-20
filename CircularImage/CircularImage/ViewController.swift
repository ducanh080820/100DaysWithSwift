//
//  ViewController.swift
//  CircularImage
//
//  Created by Tranducanh on 6/20/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                myImage.layer.cornerRadius = self.myImage.frame.height / 2.0
                myImage.layer.masksToBounds = true
    }


}

