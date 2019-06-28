//
//  BeginPageViewController.swift
//  LoginPageAnimation
//
//  Created by DSCO on 6/28/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class BeginPageViewController: UIViewController {

    //注册按钮和登陆按钮
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置按钮圆角半径
        signUpButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

}
