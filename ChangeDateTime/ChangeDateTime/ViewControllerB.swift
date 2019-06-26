//
//  ViewControllerB.swift
//  ChangeDateTime
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {
    @IBOutlet weak var myPickerDate: UIDatePicker!
    
    @IBOutlet weak var myPickerTime: UIDatePicker!
    
    var dataDate: String?
    var dataTime: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerDate.datePickerMode = UIDatePicker.Mode.date
        myPickerTime.datePickerMode = UIDatePicker.Mode.time
        openTimePicker()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: myPickerDate.date)
        dataDate = selectedDate
        
        //        let date = Date()
        //        let calender = Calendar.current
        //        let hour = calender.component(.hour, from: date)
        //        let minutes = calender.component(.minute, from: date)
        //        let seconds = calender.component(.second, from: date)
        //        dataTime = "\(hour): \(minutes): \(seconds)"
    }
    
    func openTimePicker()  {
        myPickerTime.datePickerMode = UIDatePicker.Mode.time
        myPickerTime.addTarget(self, action: #selector(self.startTimeDiveChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        dataTime = formatter.string(from: sender.date)
    }
    @IBAction func clickToBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
