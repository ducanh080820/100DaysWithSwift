//
//  DataViewController.swift
//  TestUITests
//
//  Created by DSCO on 7/8/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "Onboarding View"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel.accessibilityIdentifier = "Month Label"
        self.dataLabel.accessibilityValue = dataObject
        self.dataLabel!.text = dataObject
    }

}
