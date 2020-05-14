//
//  Note+CoreDataProperties.swift
//  DataTableViewSample
//
//  Created by Jermaine on 2020-05-14.
//  Copyright © 2020 Jermaine. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var icon: String?

}
