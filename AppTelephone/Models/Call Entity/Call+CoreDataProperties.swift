//
//  Call+CoreDataProperties.swift
//  AppTelephone
//
//  Created by Renato Tramontano on 14/08/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//
//

import Foundation
import CoreData


extension Call {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Call> {
        return NSFetchRequest<Call>(entityName: "Call")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var type: String?
    @NSManaged public var inOut: String?
    @NSManaged public var date: String?

}
