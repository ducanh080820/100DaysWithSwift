//
//  DetailViewController.swift
//  TestUITests
//
//  Created by DSCO on 7/8/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var TextFieldTwo: UITextField!
    
    var dataStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if dataStr != nil {
            TextFieldTwo.text = dataStr
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataStr = TextFieldTwo.text
    }

}
