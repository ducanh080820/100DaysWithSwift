//
//  ColorViewController.swift
//  AnimationBasic
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mylabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToChange(_ sender: UIButton) {
        
        UIView.animate(withDuration: 2.0, animations: { () -> Void in
            
            self.myView.backgroundColor = UIColor.white
            
        }, completion: nil)
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            
            self.mylabel.textColor = UIColor(red: 1.00, green: 0.52, blue: 0.07, alpha: 1.00)
        }, completion: nil)
    }
    
}
