//
//  OpacityViewController.swift
//  AnimationBasic
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToChange(_ sender: UIButton) {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.duration = 2.0
    animation.fromValue = 1.0
    animation.toValue = 0.0
    self.myImageView.layer.add(animation, forKey: "Image-opacity")
    self.myImageView.alpha = 0.0
    }
}
