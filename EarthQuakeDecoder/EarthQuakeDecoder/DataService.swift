//
//  DataService.swift
//  EarthQuakeDecoder
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct EarthQuakeInfo: Decodable {
    var event: [Event]
    struct Event: Decodable {
        var timeString: String?
        var dateString: String?
        var firstNamePlace: String?
        var lastNamePalce: String?
        var mag: Double?
        var url: String?
    }
    init(service: EarthQuakeReport) {
        self.event = service.features.map({ feature -> Event in
            let dateString = feature.properties.time.toMediumDate()
            let timeString = feature.properties.time.toShortTime()
            let mag = feature.properties.mag
            let url = feature.properties.url
            var locationName = feature.properties.place
            
            let placeStrings = feature.properties.place.components(separatedBy: " of ")
            var distanceString = ""
            if placeStrings.count > 1 {
                distanceString = placeStrings.first!
                if let index = (locationName.range(of: " of ")?.upperBound) {
                    locationName = String(locationName.suffix(from: index)) //prints "value"
                }
                
            }
            
            return Event(timeString: timeString, dateString: dateString, firstNamePlace: distanceString, lastNamePalce: locationName, mag: mag, url: url)


        })
            
    }
}

struct EarthQuakeReport: Decodable {
    var features: [Features]
    
    struct Features: Decodable {
        var properties: Property
        struct Property: Decodable {
            var mag: Double
            var place: String
            var time: TimeInterval
            var url: String
        }
    }
}

class DataService {
    
    static var shared = DataService()
    
    let urlString = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
    
    func request(complerhandler: @escaping ([EarthQuakeInfo.Event]) -> ()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let service = try JSONDecoder().decode(EarthQuakeReport.self, from: data)
                let earthQuakeInfo = EarthQuakeInfo(service: service)
                DispatchQueue.main.async {
                    complerhandler(earthQuakeInfo.event)
                }
            }catch {
                print(error)
            }
            }.resume()
        
}
}

// MARK: - TimeInterval
extension TimeInterval {
    func toShortTime() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .none
        dateFormater.timeStyle = .short
        return dateFormater.string(from: Date(timeIntervalSince1970: self / 1000))
    }
    
    func toMediumDate() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        return dateFormater.string(from: Date(timeIntervalSince1970: self / 1000))
    }
}
