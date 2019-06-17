//
//  ViewController.swift
//  Basic2
//
//  Created by duc anh on 6/17/19.
//  Copyright © 2019 duc anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    var timer: Timer?
    var start = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // These could be added in the Storyboard instead if you mark
        // buttonDown and buttonUp with @IBAction
        button.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
    }

    @objc func buttonDown(_ sender: UIButton) {
        singleFire()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(rapidFire), userInfo: nil, repeats: true)
    }
    
    @objc func buttonUp(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    func singleFire() {
        myLabel.text = "\(start)"
        start += 1
    }
    
    @objc func rapidFire() {
            myLabel.text = "\(start)"
            start += 1
    }
    @IBAction func actionReset(_ sender: UIBarButtonItem) {
        myLabel.text = "\(0)"
        start = 0
    }
    
}

