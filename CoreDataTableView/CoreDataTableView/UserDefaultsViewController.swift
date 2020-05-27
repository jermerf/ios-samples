//
//  UserPrefsViewController.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-21.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {
  
  @IBOutlet weak var txtMyWords: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadDefaults()
  }
  
  
  @IBAction func saveMyDefault(_ sender: Any) {
    UserDefaults.standard.set(txtMyWords.text, forKey: Settings.MyText.rawValue)
  }

  @IBAction func loadMyDefault(_ sender: Any) {
    txtMyWords.text = UserDefaults.standard.string(forKey: "MyText")
  }
  
  @IBOutlet weak var txtYourWords: UITextField!
  
  @IBAction func saveYourDefault(_ sender: Any) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(txtYourWords.text, forKey: "YourText")
  }
  
  @IBAction func loadYourDefault(_ sender: Any) {
    let userDefaults = UserDefaults.standard
    txtYourWords.text = userDefaults.string(forKey: "YourText")
  }
  
  @IBOutlet weak var s1: UISwitch!
  @IBOutlet weak var s2: UISwitch!
  @IBOutlet weak var s3: UISwitch!
  @IBOutlet weak var s4: UISwitch!
  @IBOutlet weak var s5: UISwitch!
  
  
  @IBAction func switchAction(_ sender: Any) {
    saveDefaults()
  }
  
  func saveDefaults(){
    let u = UserDefaults.standard
    u.set(s1.isOn, forKey: "s1")
    u.set(s2.isOn, forKey: "s2")
    u.set(s3.isOn, forKey: "s3")
    u.set(s4.isOn, forKey: "s4")
    u.set(s5.isOn, forKey: "s5")
  }
  
  func loadDefaults(){
    let u = UserDefaults.standard
    txtMyWords.text = u.string(forKey: "MyText")
    txtYourWords.text = u.string(forKey: "YourText")
    
    s1.isOn = u.bool(forKey: "s1")
    s2.isOn = u.bool(forKey: "s2")
    s3.isOn = u.bool(forKey: "s3")
    s4.isOn = u.bool	`forKey: "s4")
    s5.isOn = u.bool(forKey: "s5")
  }
  
}
