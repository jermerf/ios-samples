//
//  SecondViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-13.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  //var combined: []
  @IBOutlet weak var lblPicker: UILabel!
  
  var chosenIndexes: [Int] = [0,0,0]
  var firstPickerList: [String] = ["cat","dog","bird"]
  
  var secondPickerList: [String] = ["rabbit","trout","salmon","shark"]
  
  var thirdPickerList: [String] = ["Jermaine","Farzana","Nigel","Nate","Terry"]
  
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
      return firstPickerList.count
    }else if component == 1 {
      return secondPickerList.count
    }else{
      return thirdPickerList.count
    }
  }
  

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0 {
      return firstPickerList[row]
    }else if component == 1 {
      return secondPickerList[row]
    }else{
      return thirdPickerList[row]
    }
  }
  
  func updateLabel(){
    let animal = firstPickerList[chosenIndexes[0]]
    let food = secondPickerList[chosenIndexes[1]]
    let student = thirdPickerList[chosenIndexes[2]]
    lblPicker.text = "The \(animal) presents a \(food) to \(student)"
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    chosenIndexes[component] = row
    updateLabel()
  }
  
  
  @IBOutlet weak var lblTop: UILabel!
  @IBOutlet weak var txtInput: UITextField!
  
  @IBAction func btnTap(_ sender: Any) {
    lblTop.text = txtInput.text
  }
  
  @IBOutlet weak var picker: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    picker.dataSource = self
    picker.delegate = self
  }
  
}
