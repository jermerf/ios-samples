//
//  SampleViewController.swift
//  Sample iApp
//
//  Created by Jermaine on 2020-05-11.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class SampleViewController : UIViewController {
  
  @IBAction func callClicked(_ sender: Any) {
    print(doSomething("Edison", willSay: "Meow meow"))
  }
  
  func doSomething(_ name: String, willSay words: String) -> String {
    return name + ": " + words
  }
  
  
  
}
