//
//  ViewController.swift
//  StoryboardOverview
//
//  Created by Jermaine on 2019-11-13.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var lblMain: UILabel!
  
  @IBOutlet weak var txtSendDataTo: UITextField!
  
  @IBOutlet weak var btnLongPress: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }

  @IBAction func buttonTapped(_ sender: Any) {
    lblMain.text = "Hello World!"
  }
  
  var longPresses = 0
  var longReleases = 0
  // sender changed from Any to UILongPressGestureRecognizer
  @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
    if sender.state == UIGestureRecognizer.State.began {
      longPresses += 1
    }else{
      longReleases += 1
    }
    
    btnLongPress.setTitle("LongPress:\(longPresses), LongRelease:\(longReleases)",
      for: UIControl.State.normal)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is SendDataController {
      let dest = segue.destination as! SendDataController
      dest.someData = txtSendDataTo.text!
    }
  }
  
  // A UISplitViewController can't be inside a Navigation controller, so we have to replace
  // the rootViewController with the masterdetail one
  @IBAction func switchToMaster(_ sender: Any) {
    // Get the mainStoryboard to create the view controller by it's storyboard id.
    // (In the storyboard, select the master view controller. On the identity
    // inspector [looks like an id card] this is the storyboard id
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = mainStoryboard.instantiateViewController(withIdentifier: "masterDetailController") as! MasterViewController
    controller.mainViewController = self
    UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = controller
  }
  
}

