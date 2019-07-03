//
//  DetailViewController.swift
//  PassingData
//
//  Created by Apple on 6/19/19.
//  Copyright © 2019 DucAnh. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func passData(string: String)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextFieldDetail: UITextField!
    
    var delegate: DetailViewControllerDelegate?
    var dataText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataText != nil {
        myLabel.text = dataText
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func passDataDelegate(_ sender: UIButton) {
        delegate?.passData(string: myTextFieldDetail.text!)
        navigationController?.popViewController(animated: true)
    }

    

}
