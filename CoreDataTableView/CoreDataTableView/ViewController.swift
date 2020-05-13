//
//  ViewController.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-21.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
    
  @IBOutlet weak var newNoteField: UITextField!
  @IBOutlet weak var pickIcon: UIPickerView!
  @IBOutlet weak var notesTable: UITableView!
    
  var notes: [Note] = [Note]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    notes = Note.getNotes()
    notesTable.register(NoteCellController.self, forCellReuseIdentifier: "CustomCell")
    // Do any additional setup after loading the view.
  }

  // Add Button action
  @IBAction func addNoteAction(_ sender: Any) {
    let icon:String = icons[pickIcon.selectedRow(inComponent: 0)]
    if let words = newNoteField.text{
      if let note = Note.createNote() {
        note.icon = icon
        note.words = words
        notes.append(note)
        notesTable.reloadData()
      }
    }
  }
  
  @IBAction func searchTextChanged(_ textField: UITextField) {
    let searchText = textField.text ?? "__Unknown__"
    print("Text changed ---> \(searchText)")
    if searchText == "" {
      notes = Note.getNotes()
    }else{
      notes = Note.searchNotes(searchText: searchText)
    }
    notesTable.reloadData()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return icons.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return icons[row]
  }
  
  // Table Data Source
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: NoteCellController = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCellController
    
    cell.configure(notes[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let note = notes[indexPath.row]
    
    let alertController = UIAlertController(title: "Selected Note", message:
      note.words, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Buh Bye!", style: .default))
    self.present(alertController, animated: true, completion: nil)
    
  }
  
  
  let icons: [String] = ["sparkles","cloud","globe","car"]
}

class NoteCellController: UITableViewCell {
  @IBOutlet weak var txtWords: UILabel!
  @IBOutlet weak var imgIcon: UIImageView!
  
  var imgCache: [String: UIImage ] = [:]
  
  func configure(_ note: Note){
    let icon = note.icon ?? "questionmark.diamond.fill"
    if let img = imgCache[icon] {
      imgIcon.image = img
    }else{
      let img = UIImage(systemName: icon)
      imgCache[icon] = img
      imgIcon.image = img
    }
    txtWords.text = note.words ?? "--nowords--"
  }
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}
