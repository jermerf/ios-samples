//
//  ViewController.swift
//  ChangeTableview
//
//  Created by Jermaine on 2020-06-04.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
  }

  @IBOutlet weak var tableView: UITableView!
  
  var list = [true,false,false,true]
  @IBAction func showBools(_ sender: UIButton) {
    sender.setTitle(list.description, for: .normal)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CellTemplate
    cell.configure(list[indexPath.row])
    cell.action = {
      self.list[indexPath.row] = !self.list[indexPath.row]
      tableView.reloadData()
    }
    return cell
  }
  
}

class CellTemplate : UITableViewCell {
  @IBOutlet weak var btnTruth: UIButton!
  var action = {}
  
  func configure(_ isTrue: Bool) {
    btnTruth.setTitle(String(isTrue), for: .normal)
  }
  
  @IBAction func toggleTruth(_ sender: Any) {
    action()
  }
}
