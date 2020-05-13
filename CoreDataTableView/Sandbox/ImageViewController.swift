//
//  ImageViewController.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-28.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
  
  @IBOutlet weak var imgChosen: UIImageView!
  var imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    imagePicker.delegate = self
  }
  
  @IBAction func chooseImage(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
      print("Button capture")
      imagePicker.sourceType = .savedPhotosAlbum
      imagePicker.allowsEditing = false
      
      present(imagePicker, animated: true, completion: nil)
    }
  }
  
  
  func getSavePath() -> URL{
    let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  @IBAction func saveImage(_ sender: Any) {
    let path = getSavePath().appendingPathComponent("MyImageName.jpg")
    do{
      let jpg = imgChosen.image?.jpegData(compressionQuality: 90)
      try jpg?.write(to: path)
      print("Saved")
    }catch{
      print("** couldn't save **")
    }
    
  }
  
  @IBAction func loadImage(_ sender: Any) {
    let path = getSavePath().appendingPathComponent("MyImageName.jpg")
    do{
      let data = try Data(contentsOf: path)
      imgChosen.image = UIImage(data: data)
      print("loaded")
    }catch{
      print("** couldn't save **")
    }
    
  }
  
}

extension ImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    imgChosen.image =   image
  }
  public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("cancelled")
  }

}
