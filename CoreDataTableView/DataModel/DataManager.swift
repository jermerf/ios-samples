//
//  DataManager.swift
//  BaseToCoreData
//
//  Created by Jermaine on 2019-11-20.
//  Copyright © 2019 Jermaine. All rights reserved.
//

import CoreData

class DataManager {
  static let instance = DataManager()
  
  init(){}
  
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MyDataModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  public static func getContext() -> NSManagedObjectContext {
    return instance.persistentContainer.viewContext
  }
  
  public static func saveContext () -> Bool {
    let context = getContext()
    if context.hasChanges {
      do {
        try context.save()
        return true
      } catch {
        let nserror = error as NSError
        return false
      }
    } else {
      return false
    }
  }
}
