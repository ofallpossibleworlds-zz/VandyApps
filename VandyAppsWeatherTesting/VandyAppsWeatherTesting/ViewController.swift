//
//  ViewController.swift
//  VandyAppsWeatherTesting
//
//  Created by Robby on 3/26/18.
//  Copyright © 2018 Marshall. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var forecastLabel: UILabel!
    let debug = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://api.darksky.net/forecast/8124f59c6431d255e8f1f5a43b5b22f8/37.8267,-122.4233"
        
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
                                if let currentWeather = weather["currently"] {
                                    if let weatherSummary = currentWeather as? [String:Any] {
                                        if let summaryText = weatherSummary["summary"] as? String {
                                            DispatchQueue.main.async {
                                                self.forecastLabel.text = "It's " + summaryText + "!"
                                            }
                                        }
                                    }
                                    print(currentWeather)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

