//
//  User+CoreDataProperties.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 20/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstTime: Bool
    @NSManaged public var loginStatus: Bool

}
