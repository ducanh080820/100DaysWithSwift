//
//  RotationViewController.swift
//  AnimationBasic
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickToChange(_ sender: UIButton) {
        UIView.animate(withDuration: 5.0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
            
            self.myImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.radix))
            
        }, completion: nil)
    }

}
