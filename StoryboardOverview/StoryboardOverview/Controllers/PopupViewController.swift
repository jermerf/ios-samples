//
//  PopupViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-15.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  @IBOutlet weak var lblBurger: UILabel!
  var pickerBuns: [String] = ["Plain", "Sesame", "Whole Wheat"]
  var pickerPatties: [String] = ["Beef", "Chicken", "Veggie", "Pork"]
  var chosenBun = 0
  var chosenPatty = 0
    
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
    
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
      return pickerBuns.count
    }else{
      return pickerPatties.count
    }
    
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0 {
      return pickerBuns[row]
    }else{
      return pickerPatties[row]
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      chosenBun = row
    }else{
      chosenPatty = row
    }
    lblBurger.text = "A \(pickerBuns[chosenBun]) bun for a \(pickerPatties[chosenPatty]) burger"
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is PickerModalViewController {
      let dest = segue.destination as! PickerModalViewController
      dest.dataSource = self
      dest.pickerDelegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
