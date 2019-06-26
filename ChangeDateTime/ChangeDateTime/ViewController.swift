//
//  ViewController.swift
//  ChangeDateTime
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabelTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        let vc = unwindSegue.source as? ViewControllerB
         myLabel.text = vc?.dataDate
        myLabelTime.text = vc?.dataTime
    }
  
    
}

