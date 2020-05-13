//
//  Note+CoreDataClass.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-21.
//  Copyright © 2019 Jermaine. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
  
  
  
  static func createNote() -> Note? {
    let context = DataManager.getContext()
    let noteEntity = Note.entity()
    let note = Note(entity: noteEntity, insertInto: context)
    
    return note
  }
  
  static func save() {
    DataManager.saveContext()
  }
  
  static func getNotes() -> [Note] {
    let context = DataManager.getContext()
    
    do{
      return try context.fetch(Note.fetchRequest())
    }catch{
      return [Note]()
    }
  }
  
  
  static func searchNotes(searchText: String) -> [Note] {
    let context = DataManager.getContext()
    
    do{
      let fetch: NSFetchRequest<Note> = Note.fetchRequest()
      fetch.predicate = NSPredicate(format: "words contains[cd] %@", searchText)
      return try context.fetch(fetch)
    }catch{
      return [Note]()
    }
  }
  	
}
