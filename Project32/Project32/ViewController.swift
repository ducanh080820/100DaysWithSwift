//
//  ViewController.swift
//  Project32
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let marioSize = 128
    let mushroomSize = 40
    let screenWidth = UIScreen.main.bounds.width
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func shoot() {
        //shoot mushroom
        let mushroom = UIImageView(frame: CGRect(x: marioSize, y: Int(self.myImage.frame.origin.y), width: mushroomSize, height: mushroomSize))
        mushroom.image = UIImage(named: "mushroom.png")
        self.view.addSubview(mushroom)
        
        myImage.image = UIImage(named: "mario2.png")
        
        //shoot
        UIView.animate(withDuration: 0.3, animations: {
            mushroom.frame = CGRect(x: Int(self.screenWidth), y: Int(self.myImage.frame.origin.y), width: self.mushroomSize, height: self.mushroomSize)
            
        }, completion: { finished in
            self.myImage.image = UIImage(named: "mario1.png")
        })
    }
    
    @IBAction func clickToShoot(_ sender: UIButton) {
        sender.addTarget(self, action: #selector(shoot), for: .touchUpInside)
        
    }
    
}

