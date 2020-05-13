//
//  ModalViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-15.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class PickerIndexController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  let stuff:[String] = ["Cat","Dog","Bird"]
  
  @IBOutlet weak var pick: UIPickerView!
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return stuff.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return stuff[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
  }
  
  @IBAction func selectPick(_ sender: Any) {
    pick.selectRow(2, inComponent: 0, animated: true)
    UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
  }
  
}

