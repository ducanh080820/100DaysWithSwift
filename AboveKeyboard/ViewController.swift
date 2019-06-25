//
//  ViewController.swift
//  AboveKeyboard
//
//  Created by DSCO on 6/25/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lable: UILabel!
    var dateFormatter = DateFormatter()
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateFormatter.dateFormat = "MMM dd, yyyy"
        lable = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 20))
        lable.text = dateFormatter.string(from: NSDate() as Date)
        lable.textColor = UIColor.init(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        lable.font = UIFont(name: "Thonburi", size: 10)
        lable.textAlignment = NSTextAlignment.center
        self.view.addSubview(lable)
        
        textView = UITextView(frame: CGRect(x: 0, y: 115, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 100))
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        addToolBar(textField: textView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addToolBar(textField: UITextView){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraAction))
        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil);
        btngap1.width = 30
        let locatButton = UIBarButtonItem()
        locatButton.image = UIImage.init(named: "location")
        locatButton.action = #selector(locatAction)
        
        toolBar.setItems([cameraButton, btngap1, locatButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    func closeAction() {
        //
    }
    
    func saveAction() {
        //
    }
    
    @objc func cameraAction() {
        //
    }
    
    @objc func locatAction() {
        //
    }


}

