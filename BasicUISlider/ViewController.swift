//
//  ViewController.swift
//  BasicUISlider
//
//  Created by Duc Anh on 6/18/19.
//  Copyright © 2019 Duc Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
  mylabel.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: CGFloat(slider.value))
        
    }

    @IBAction func dragSlider(_ sender: UISlider) {
        mylabel.textColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: CGFloat(sender.value))
        print("\(sender.value)")
    }

}

