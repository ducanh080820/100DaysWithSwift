//
//  ViewController.swift
//  PassingData
//
//  Created by Apple on 6/19/19.
//  Copyright © 2019 DucAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailViewController
        destination?.dataText = myTextField.text
    }

    @IBAction func actionShow(_ sender: UIBarButtonItem) {
    }
    
}

