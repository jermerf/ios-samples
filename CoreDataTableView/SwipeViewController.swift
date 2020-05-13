//
//  SwipeViewController.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-29.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @IBOutlet weak var txt: UILabel!
  @IBAction func dfd(_ sender: Any) {
    txt.text = "Kittens and stuff. Woo!"
  }
  
}
