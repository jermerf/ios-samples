//
//  SendDataController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-14.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class SendDataController: UIViewController {
  
  var someData: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    lblData.text = someData
  }
  
  @IBOutlet weak var lblData: UILabel!
}
