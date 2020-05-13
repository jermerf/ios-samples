
import UIKit

class FirstTabController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func swiped(_ sender: UILongPressGestureRecognizer) {
    if sender.state == UIGestureRecognizer.State.ended {
      
    }
    self.tabBarController?.selectedIndex += 1
  }
  
}
