//
//  ViewController.swift
//  OpenCvTest
//
//  Created by Jermaine on 2020-05-20.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBOutlet weak var imgMain: UIImageView!
  
  @IBAction func getImage(_ sender: Any) {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = false
    imagePicker.delegate = self
    present(imagePicker, animated: true, completion: nil)
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage;
    imgMain.image = img;
    picker.dismiss(animated: true, completion: nil)
  }
}
