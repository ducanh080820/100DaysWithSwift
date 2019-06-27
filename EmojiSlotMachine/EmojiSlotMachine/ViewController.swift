//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var BtnGo: UIButton!
    @IBOutlet weak var labelResult: UILabel!

    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var amazingFlag = false
    var bounds: CGRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = BtnGo.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0...100 {
            self.dataArray1.append((Int)(arc4random() % 10 ))
            self.dataArray2.append((Int)(arc4random() % 10 ))
            self.dataArray3.append((Int)(arc4random() % 10 ))
        }
        
        labelResult.text = ""
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        BtnGo.layer.cornerRadius = 6
        BtnGo.layer.masksToBounds = true
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BtnGo.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            
            self.BtnGo.alpha = 1
            
        }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Đánh dấu: sự kiện nút
    @IBAction func amazingButtonDidTouch(_ sender: UIButton) {
        amazingFlag = !amazingFlag
        sender.setTitle(amazingFlag ? "Chế độ mở":"Chế độ thông thường", for: .normal)
    }
    @IBAction func goButtoDidTouch(_ sender: AnyObject) {
        let index1: Int
        let index2: Int
        let index3: Int
        if amazingFlag {
            index1 = Int(arc4random()) % 90 + 3
            index2 = dataArray2.firstIndex(of: dataArray1[index1])!
            index3 = dataArray3.lastIndex(of: dataArray1[index1])!
            
        } else {
            index1 = Int(arc4random()) % 90 + 3
            index2 = Int(arc4random()) % 90 + 3
            index3 = Int(arc4random()) % 90 + 3
        }
        
        myPickerView.selectRow(index1, inComponent: 0, animated: true)
        myPickerView.selectRow(index2, inComponent: 1, animated: true)
        myPickerView.selectRow(index3, inComponent: 2, animated: true)
        
        
        if(dataArray1[myPickerView.selectedRow(inComponent: 0)] == dataArray2[myPickerView.selectedRow(inComponent: 1)] && dataArray2[myPickerView.selectedRow(inComponent: 1)] == dataArray3[myPickerView.selectedRow(inComponent: 2)]) {
            
            labelResult.text = "Bingo!"
            
        } else {
            
            labelResult.text = "💔"
            
        }
        
        
        //animate
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.BtnGo.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 20, height: self.bounds.size.height)
            
        }, completion: { (compelete: Bool) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions(), animations: {
                
                self.BtnGo.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
            }, completion: nil)
            
        })
        
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK:UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // MARK:UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }


}

