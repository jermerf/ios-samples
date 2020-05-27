//
//  ViewController.swift
//  Category Test
//
//  Created by Jermaine on 2020-05-26.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var txtCategory: UITextField!
  @IBOutlet weak var tableCategories: UITableView!
  
  var categories = [ListCategory]()
  let context: NSManagedObjectContext = DataManager.getContext()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    reloadCategories()
  }
  
  @IBAction func addClicked(_ sender: Any) {
    // The name 'Category' is used in swift
    // don't name anything 'Category'
    let catEntity = ListCategory.entity()
    let cat = ListCategory(entity: catEntity, insertInto: context)
    cat.name = txtCategory.text
    do {
      try context.save()
      txtCategory.text = ""
      reloadCategories()
    } catch {
      
    }
  }
  
  func reloadCategories(){
    do {
      let request = NSFetchRequest<ListCategory>(entityName: "ListCategory")
      categories = try context.fetch(request)
      tableCategories.reloadData()
    } catch {
      return
    }
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableCategories.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
    let cat = categories[indexPath.row]
    cell.lblName.text = cat.name
    return cell
  }
  
  
  
}


class CategoryCell: UITableViewCell {

  @IBOutlet weak var lblName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  

}


