//
//  ViewController.swift
//  TumblrMenu
//
//  Created by DSCO on 7/4/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
}

