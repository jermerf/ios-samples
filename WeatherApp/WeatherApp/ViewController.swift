//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jermaine on 2020-05-25.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var txtCity: UITextField!
  @IBOutlet weak var lblTemp: UILabel!
  @IBOutlet weak var imgWeather: UIImageView!
  @IBOutlet weak var lblWind: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func getWeather(_ sender: Any) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=6565d5a438410f02d391a6dee21a7eed&q="
      + (txtCity.text ?? "San Francisco")
    
    if let url = URL(string: urlString) {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
            do {
              if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                self.showWeather(json)
              }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
          }
       }.resume()
    }
  }
  
  func showWeather(_ json: [String: Any] ) {
    guard let main = json["main"] as? [String: Any] else { return }
    guard let temp = main["temp"] as? Double else { return }
    guard let wind = json["wind"] as? [String: Any] else { return }
    guard let windSpeed = wind["speed"] as? Double else { return }
    
    DispatchQueue.main.async {
      self.lblTemp.text = "\(round(temp - 273.15)) ˚"
      self.lblWind.text = "\(round(windSpeed)) km/h"

    }
    
    
  }
  
}

