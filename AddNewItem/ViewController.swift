//
//  ViewController.swift
//  AddNewItem
//
//  Created by duc anh on 6/20/19.
//  Copyright © 2019 duc anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    var dataString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataString = myTextField.text
    }

}

