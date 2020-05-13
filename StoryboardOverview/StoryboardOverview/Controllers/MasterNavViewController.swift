//
//  MasterNavViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2020-05-13.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class MasterNavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  @IBAction func backToMainController(_ sender: Any) {
    let masterVC: MasterViewController = navigationController?.splitViewController as! MasterViewController		
    UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = masterVC.mainViewController
  }
  

}
