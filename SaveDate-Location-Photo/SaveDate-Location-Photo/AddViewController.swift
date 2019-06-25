//
//  AddViewController.swift
//  SaveDate-Location-Photo
//
//  Created by DSCO on 6/25/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit
import CoreLocation

class AddViewController: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate {
    
    var navigationBar: UINavigationBar!
    var lable: UILabel! //新增日期
    var dateFormatter = DateFormatter()
    var textView: UITextView!
    var imagePicker: UIImagePickerController!
    let toolBar = UIToolbar()
    var locat = "地址信息" //定位信息
    
    var locationManager: CLLocationManager!
    
    //  代理成员变量
    weak var delegate: ModeViewControlDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Entry"
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeAction))
        let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveAction))
        self.view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        lable = UILabel(frame: CGRect(x: 0, y: 70, width: self.view.bounds.size.width, height: 10))
        lable.text = dateFormatter.string(from: NSDate() as Date)
        lable.textColor = UIColor.init(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        lable.font = UIFont(name: "Thonburi", size: 10)
        lable.textAlignment = NSTextAlignment.center
        self.view.addSubview(lable)
        
        textView = UITextView(frame: CGRect(x: 0, y: 85, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 60))
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            locationManager.requestAlwaysAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locatAction()
        
        addToolBar(textField: textView)
    }
    
    func addToolBar(textField: UITextView) {
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraAction))
        let btngap1 =  UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil);
        btngap1.width = 30
        let locatButton = UIBarButtonItem()
        locatButton.image = UIImage.init(named: "location")
        locatButton.action = #selector(locatAction)
        let title = UIBarButtonItem()
        let butlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 15))
        butlabel.textAlignment = .right
        butlabel.text = locat
        title.customView = butlabel
        
        toolBar.setItems([cameraButton, btngap1, locatButton, title], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
    
    @objc func cameraAction() {
        self.imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let attachment = NSTextAttachment()
        attachment.image = scaleImage(image: image)
        let attString = NSAttributedString(attachment: attachment)
        textView.textStorage.insert(attString, at: textView.selectedRange.location)
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func scaleImage(image:UIImage) -> UIImage{
        UIGraphicsBeginImageContext(CGSize(width: self.view.bounds.size.width, height: image.size.height*(self.view.bounds.size.width/image.size.width)))
        image.draw(in: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: image.size.height*(self.view.bounds.size.width/image.size.width)))
        let scaledimage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return scaledimage
    }
    
    @objc func locatAction() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = manager.location!.coordinate.latitude
        let longitude = manager.location!.coordinate.longitude
        
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: latitude, longitude: longitude)
        geocoder.reverseGeocodeLocation(currentLocation, completionHandler: {
            (placemarks:[CLPlacemark]?, error:NSError?) -> Void in
            print("轉換經緯度ING~")
            //强制转成简体中文
            let array = NSArray(object: "zh-hans")
            UserDefaults.standard.set(array, forKey: "AppleLanguages")
            //显示所有信息
            if error != nil {
                self.locat = "错误：\(error!.localizedDescription))"
                return
            }
            
            if let p = placemarks?[0]{
                //输出反编码信息
                self.locat = p.name!
                print(self.locat)
            } else {
                print("No placemarks!")
            }
            } as! CLGeocodeCompletionHandler )
    }
    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("位置獲取失敗：\(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func closeAction() {
        navigationController!.popViewController(animated: true)
    }
    
    @objc func saveAction() {
        let user: [String: String] = [
            "id": "003",
            "date": lable.text!,
            "ico": "icon-1.jpg",
            "note": textView.text,
            "location": locat
        ]
        if self.delegate != nil {
            self.delegate!.changeData(user: user)
        } else {
            print("delegate is nil")
        }
        navigationController!.popViewController(animated: true)
    }
}
