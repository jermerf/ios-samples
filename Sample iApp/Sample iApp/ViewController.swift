//
//  ViewController.swift
//  Sample iApp
//
//  Created by Jermaine on 2020-05-11.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return students.count
  }

  var students = ["Andrei","Joy","Rob","Shawn"]
  
  func doSomething(name: String) -> String {
    return "blah"
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return students[row]
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBOutlet weak var btnChange: UIButton!
  
  
  @IBAction func changeClicked(_ sender: Any) {
    btnChange.setTitle( "I have changed", for: UIButton.State.normal)
  }
  
  
  
}

