//
//  Note+CoreDataClass.swift
//  DataTableViewSample
//
//  Created by Jermaine on 2020-05-14.
//  Copyright © 2020 Jermaine. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

  static func createNote() -> Note {
    let context = DataManager.getContext()
    let noteEntity = Note.entity()
    let note = Note(entity: noteEntity, insertInto: context)
    return note
  }
  
  
  static func getNotes() -> [Note] {
    let context = DataManager.getContext()
    
    do {
      return try context.fetch(Note.fetchRequest())
    } catch {
      return [Note]()
    }
  }
  
  func save() {
    DataManager.saveContext()
  }
}
