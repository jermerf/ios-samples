//
//  ViewController.swift
//  DataTableViewSample
//
//  Created by Jermaine on 2020-05-14.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
UIPickerViewDelegate, UIPickerViewDataSource{
  
  @IBOutlet weak var txtNote: UITextField!
  
  @IBOutlet weak var tableNotes: UITableView!
  
  var notes: [Note] = [Note]()
  let icons = ["sunrise.fill","pencil","calendar","globe"]
  var chosenIcon = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    notes = Note.getNotes()
  }

  @IBAction func addTapped(_ sender: Any) {
    let note = Note.createNote()
    note.icon = icons[chosenIcon]
    note.text = txtNote.text!
    note.save()
    notes.append(note)
    txtNote.text = ""
    tableNotes.reloadData()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    icons.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return icons[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    chosenIcon = row
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: NoteTableCell = tableNotes!.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteTableCell
    let note = notes[indexPath.row]
    cell.configure(icon: note.icon, text: note.text)
    return cell
  }
}

class NoteTableCell : UITableViewCell {
  
  @IBOutlet weak var imgNote: UIImageView!
  @IBOutlet weak var lblNote: UILabel!
  
  func configure(icon: String?, text: String?) {
    let unwIcon = icon ?? "sunrise.fill"
    let unwText = text ?? ""
    imgNote.image = UIImage(systemName: unwIcon)
    lblNote.text = unwText
  }
}
