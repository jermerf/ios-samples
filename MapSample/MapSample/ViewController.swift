//
//  ViewController.swift
//  MapSample
//
//  Created by Jermaine on 2020-05-27.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    map.delegate = self
  }

  let locationManager = CLLocationManager()
  @IBOutlet weak var map: MKMapView!
  
  
  @IBAction func findMyLocation(_ sender: Any) {
    
    let coord = CLLocationCoordinate2D(latitude: 46.05, longitude: -66.2)
    let region = MKCoordinateRegion(center: coord, latitudinalMeters: 10000, longitudinalMeters: 10000)
    map.setRegion(region, animated: true)
    
  }
  
  @IBAction func toPortrait(_ sender: Any) {
    let orientation = UIInterfaceOrientation.portrait.rawValue
    UIDevice.current.setValue(orientation, forKey: "orientation")
  }
  
  @IBAction func toLandscape(_ sender: Any) {
    let orientation = UIInterfaceOrientation.landscapeLeft.rawValue
    UIDevice.current.setValue(orientation, forKey: "orientation")
  }
  
}

