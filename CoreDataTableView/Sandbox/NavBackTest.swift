
import UIKit

class NavBackTest: UIViewController {
  @IBAction func nextPlace(_ sender: Any) {
    let sb: UIStoryboard = UIStoryboard(name: "sandbox", bundle: nil)
    let vc: NextViewController = sb.instantiateViewController(withIdentifier: "NextPlace") as! NextViewController
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}
