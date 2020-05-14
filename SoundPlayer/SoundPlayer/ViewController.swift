//
//  ViewController.swift
//  SoundPlayer
//
//  Created by Jermaine on 2020-05-13.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var player = AVAudioPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func playSound(_ sender: Any) {
    let meow = Bundle.main.path(forResource: "meow", ofType: "mp3")
    player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: meow!))
    player.play()
  }
  
}

