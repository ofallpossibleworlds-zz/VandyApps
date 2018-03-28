//
//  ViewController.swift
//  VandyAppsWeatherTesting
//
//  Created by Robby on 3/26/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var forecastLabel: UILabel!
    var locationManager: CLLocationManager!
    var userLocation:CLLocation?
    let debug = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        determineMyCurrentLocation()
        
        var url = "https://api.darksky.net/forecast/8124f59c6431d255e8f1f5a43b5b22f8/"
        if let myLocation = userLocation {
            url += String(myLocation.coordinate.latitude)
            url += ","
            url += String(myLocation.coordinate.longitude)
        } else {
            url += "37.8267,-122.4233"
        }
        
        updateForecast(withAPIString: url)
    }
    
    func updateForecast(withAPIString url:String) {
        let urlString = URL(string: url)
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let data = data {
                        if let _ = String(data: data, encoding: String.Encoding.utf8) {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            if let weather = jsonData as? [String: Any] {
                                if self.debug { print(weather) }
                                if let currentWeather = weather["currently"] {
                                    if let weatherSummary = currentWeather as? [String:Any] {
                                        if let summaryText = weatherSummary["summary"] as? String {
                                            DispatchQueue.main.async {
                                                self.forecastLabel.text = "It's " + summaryText + "!"
                                            }
                                        }
                                    }
                                } else if self.debug {
                                    print("Couldn't find current weather")
                                }
                            } else if self.debug {
                                print("dictionary error")
                            }
                        } else if self.debug {
                            print("Parse error")
                        }
                    } else if self.debug {
                        print("Data error")
                    }
                }
            }
            task.resume()
        }
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
         manager.stopUpdatingLocation()
        
        if self.debug {
            print("user latitude = \(userLocation.coordinate.latitude)")
            print("user longitude = \(userLocation.coordinate.longitude)")
        }
    }


}

