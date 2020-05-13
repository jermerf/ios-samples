//
//  ModalViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-15.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class PickerModalViewController: UIViewController {
  
  var dataSource: UIPickerViewDataSource?
  var pickerDelegate: UIPickerViewDelegate?
  
  @IBOutlet weak var picker: UIPickerView!
  
  @IBAction func backTapped(_ sender: Any) {
    dismiss(animated: true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    if dataSource == nil && pickerDelegate == nil {
      // Not setup correctly
      print("** Picker modal not setup correctly. Set 'dataSource' and 'pickerDelegate' properties **")
    }
    if let src = dataSource {
      picker.dataSource = src
    }
    if let del = pickerDelegate{
      picker.delegate = del
    }
  }
  
}

