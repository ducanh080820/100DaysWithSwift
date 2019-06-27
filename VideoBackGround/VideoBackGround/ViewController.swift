//
//  ViewController.swift
//  VideoBackGround
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoBackground()
        
        btnLogin.layer.cornerRadius = 5
        btnSignUp.layer.cornerRadius = 5
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: 配置
    func setupVideoBackground() {
        
        guard let path = Bundle.main.path(forResource: "abc", ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        let videoUrl = URL(fileURLWithPath: path)
        videoFrame = view.frame
        fillMode = ScalingMode.resizeAspectFill
        alwaysRepeat = true
        sound = false
        startTime = 2.0
        alpha = 0.8
        
        contentURL = videoUrl
        view.isUserInteractionEnabled = false
    }


}

