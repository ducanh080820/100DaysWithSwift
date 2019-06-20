//
//  ViewController.swift
//  SetLocation
//
//  Created by Tranducanh on 6/20/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLable: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func refreshLocation(sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
//            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = manager.location!.coordinate.latitude
        let longitude = manager.location!.coordinate.longitude
        
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: latitude, longitude: longitude)
        geocoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
            let array = NSArray(object: "en-GB")
            UserDefaults.standard.set(array, forKey: "AppleLanguages")
            if error != nil {
                self.locationLable.text = "error：\(error!.localizedDescription))"
                return
            }
            if let placemark = placemarks?[0] {
                let address = "\(placemark.thoroughfare ?? ""), \(placemark.locality ?? ""), \(placemark.subLocality ?? ""), \(placemark.administrativeArea ?? ""), \(placemark.postalCode ?? ""), \(placemark.country ?? "")"
                self.locationLable.text = address
            } else {
                print("No placemarks!")
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("error：\(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

