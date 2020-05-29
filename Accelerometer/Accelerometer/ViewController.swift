//
//  ViewController.swift
//  Accelerometer
//
//  Created by Jermaine on 2020-05-28.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

  
  var motionManager = CMMotionManager()

  @IBOutlet weak var lblX: UILabel!
  @IBOutlet weak var lblY: UILabel!
  @IBOutlet weak var lblZ: UILabel!
  @IBOutlet weak var lblSwipes: UILabel!
  var swipes = 0
  @IBOutlet weak var lblScale: UILabel!
  @IBOutlet var pincher: UIPinchGestureRecognizer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    motionManager.accelerometerUpdateInterval = 10
    motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {(data, error) in
      if let accelData = data {
        self.lblX.text = "\(accelData.acceleration.x)"
        self.lblY.text = "\(accelData.acceleration.y)"
        self.lblZ.text = "\(accelData.acceleration.z)"
      }
    }
  }
  
  @IBAction func swipedRight(_ sender: Any) {
    swipes += 1
    lblSwipes.text = "Swipes \(swipes)"
  }
  
  @IBAction func pinching(_ gestureRecognizer: UIPinchGestureRecognizer) {
    guard gestureRecognizer.view != nil else { return }
    lblScale.text = "Scale \(gestureRecognizer.scale)"
  }
}

