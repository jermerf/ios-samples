
import UIKit

class TableViewCellExampleViewController: UIViewController {
  
  var data: [ [String:String] ] = [
    ["icon": "pencil", "words": "Hello World"],
    ["icon": "trash", "words": "Bonjour Tous Le Monde!"],
    ["icon": "folder", "words": "Hola!"]
  ]
  
  @IBOutlet weak var tableOutlet: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}


extension TableViewCellExampleViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SimpleCustomCell = tableView.dequeueReusableCell(withIdentifier: "MySimpleCell", for: indexPath) as! SimpleCustomCell
    
    let myData = data[indexPath.row]
    cell.myIcon.image = UIImage(systemName: myData["icon"] ?? "" )
    cell.myLabel.text = myData["words"] ?? ""
    
    return cell
  }

  
}

class SimpleCustomCell: UITableViewCell {
  @IBOutlet weak var myIcon: UIImageView!
  @IBOutlet weak var myLabel: UILabel!
  
  
  
}
