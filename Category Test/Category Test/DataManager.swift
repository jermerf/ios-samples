//
//  DataManager.swift
//  DataTableViewSample
//
//  Created by Jermaine on 2020-05-14.
//  Copyright © 2020 Jermaine. All rights reserved.
//

import CoreData

class DataManager {
  static let instance = DataManager()
  
  init(){}
  
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MainDataModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Couldn't load model, let sad \(error)")
      }
    })
    return container
  }()
  
  public static func getContext() -> NSManagedObjectContext{
    return instance.persistentContainer.viewContext
  }
  public static func saveContext() -> Bool {
    let context = getContext()
    if context.hasChanges {
      do {
        try context.save()
        return true
      } catch {
        return false
      }
    }
    return false
  }
}
