//
//  ViewController.swift
//  Contacts
//
//  Created by Tranducanh on 6/20/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var icoView: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var mobileLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    var selectedValue = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icoView.image = UIImage(named: selectedValue["avatarBig"]!)
        icoView.layer.masksToBounds = true
        icoView.layer.cornerRadius = icoView.frame.size.width / 2
        icoView.layer.borderWidth = 3.0;
        let color = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        icoView.layer.borderColor = color.cgColor
        
        firstName.text = selectedValue["name"]
        mobileLable.text = selectedValue["mobile"]
        emailLable.text = selectedValue["email"]
        notesTextView.text = selectedValue["notes"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

