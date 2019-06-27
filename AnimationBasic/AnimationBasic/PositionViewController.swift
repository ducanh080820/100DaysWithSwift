//
//  ViewController.swift
//  AnimationBasic
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    @IBOutlet weak var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func upBtn(_ sender: UIButton) {
        let frame = squareView.frame
        let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y - 10, width: frame.size.width, height: frame.size.height)
        squareView.frame = newFrame
    }
    
    @IBAction func downBtn(_ sender: UIButton) {
        let frame = squareView.frame
        let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y + 10, width: frame.size.width, height: frame.size.height)
        squareView.frame = newFrame
    }
    @IBAction func leftBtn(_ sender: UIButton) {
        let frame = squareView.frame
        let newFrame = CGRect(x: frame.origin.x - 10, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
        squareView.frame = newFrame
    }
    @IBAction func rightBtn(_ sender: UIButton) {
        let frame = squareView.frame
        let newFrame = CGRect(x: frame.origin.x + 10, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
        squareView.frame = newFrame
    }
    
}

