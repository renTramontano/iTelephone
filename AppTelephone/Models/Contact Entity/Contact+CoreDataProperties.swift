//
//  Contact+CoreDataProperties.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 14/08/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var email: String?
    @NSManaged public var imageContact: NSData?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var society: String?
    @NSManaged public var surname: String?
    @NSManaged public var type: String?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var attribute1: NSObject?
    @NSManaged public var attribute2: NSObject?
    @NSManaged public var attribute3: NSObject?
    @NSManaged public var attribute4: NSObject?

}
