//
//  ViewController.swift
//  TestUITests
//
//  Created by DSCO on 7/8/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldOne: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .red
        
    }

    @IBAction func clickToNext(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.dataStr = textFieldOne.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? DetailViewController
        
        textFieldOne.text = sourceViewController?.dataStr
        
    }
    
}

