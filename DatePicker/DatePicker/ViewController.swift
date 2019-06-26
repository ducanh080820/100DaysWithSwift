//
//  ViewController.swift
//  DatePicker
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myDatePicker.datePickerMode = UIDatePicker.Mode.date
    }

    @IBAction func clickSetDate(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: myDatePicker.date)
        self.navigationItem.title = selectedDate
    }
    
}

