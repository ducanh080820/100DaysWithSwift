//
//  ScaleViewController.swift
//  AnimationBasic
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToChange(_ sender: UIButton) {
    UIView.animate(withDuration: 2.0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
    
    self.myImageView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
    self.myImageView.transform = CGAffineTransform.identity
    
    }, completion: nil)
    }
}
