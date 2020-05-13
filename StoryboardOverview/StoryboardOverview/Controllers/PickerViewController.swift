
import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  
  @IBOutlet weak var burgerPicker: UIPickerView!
  
  @IBOutlet weak var lblBurger: UILabel!
  
  // Only prints out row numbers, illustrates using the same class for two pickers
  @IBOutlet weak var alterPicker: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    alterPicker.dataSource = self
    alterPicker.delegate = self
    burgerPicker.dataSource = self
    burgerPicker.delegate = self
  }
  
  var pickerBuns: [String] = ["Plain", "Sesame", "Whole Wheat"]
  var pickerPatties: [String] = ["Beef", "Chicken", "Veggie", "Pork"]
  var chosenBun = 0
  var chosenPatty = 0
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    // Since this class is controlling multiple pickers, we need
    // to distinguish between them
    if pickerView == alterPicker {
      return 1
    }else{
      return 2
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView == alterPicker {
      return 10
    }else{
      if component == 0 {
        return pickerBuns.count
      }else{
        return pickerPatties.count
      }
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView == alterPicker {
      return "Row \(row)"
    }else{
      if component == 0 {
        return pickerBuns[row]
      }else{
        return pickerPatties[row]
      }
    }
  }
    
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView == alterPicker {
      
    }else{
      if component == 0 {
        chosenBun = row
      }else{
        chosenPatty = row
      }
      lblBurger.text = "A \(pickerBuns[chosenBun]) bun for a \(pickerPatties[chosenPatty]) burger"
    }
  }
  
  
  
  
}
