//
//  Note+CoreDataProperties.swift
//  CoreDataTableView
//
//  Created by Jermaine on 2019-11-21.
//  Copyright © 2019 Jermaine. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

  @NSManaged public var words: String?
  @NSManaged public var icon: String?

}
