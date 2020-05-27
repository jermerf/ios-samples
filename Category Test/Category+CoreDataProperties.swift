//
//  Category+CoreDataProperties.swift
//  Category Test
//
//  Created by Jermaine on 2020-05-26.
//  Copyright © 2020 Jermaine. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?

}
