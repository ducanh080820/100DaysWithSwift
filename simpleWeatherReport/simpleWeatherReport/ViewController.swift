//
//  ViewController.swift
//  simpleWeatherReport
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct Weather {
    var city: String?
    var weather: String?
    var temp: String?
}

typealias JSON = Dictionary<AnyHashable, Any>

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var weatherData: Weather? {
        didSet {
            configView()
        }
    }
    
    func configView() {
        cityLabel.text = self.weatherData?.city
        weatherLabel.text = self.weatherData?.weather
        tempLabel.text = self.weatherData?.temp
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getWeatherData()
        getData(urlString: "http://api.k780.com:88/?app=weather.today&weaid=173&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json") { data in
            print(data)
        }
    }
    
    func getWeatherData() {
        
        guard let url  = URL(string: "http://api.k780.com:88/?app=weather.today&weaid=173&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json") else { return }
        
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)

            URLSession.shared.dataTask(with: urlRequest) {(data, _, error) in

                if error != nil {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    as? NSDictionary {
                    
                    let weather = (json.value(forKey: "result") as? NSDictionary).map {
                        Weather(city: $0["citynm"] as? String,
                                weather: $0["weather"] as? String,
                                temp: $0["temperature_curr"] as? String)
                    }
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.weatherData = weather
                    })
                    
                    
                }
                }
        }.resume()
        
    }
    
    func getData(urlString: String, completeBlock:  @escaping (JSON) -> Void) {
        guard let url = URL(string: urlString) else {return}

        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        
        URLSession.shared.dataTask(with: urlRequest) {(data, _, error) in
            
            guard error == nil else {
                return
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) else {
                return
            }
            guard let json = jsonObject as? JSON else {
                return
            }
            DispatchQueue.main.async {
                completeBlock(json)
                
            }
            }.resume()
    }
    
    
}

