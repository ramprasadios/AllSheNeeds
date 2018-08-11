//
//  User+CoreDataClass.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 11/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    static func getUser() -> User? {
        guard let moc = CoreDataManager.default.managedObjectContext else { return nil }
        do {
            let user = try moc.fetch(self.fetchRequest())
            return user.first as? User
        } catch let error {
            print("No user Object found \(error)")
            return nil
        }
    }
    
    static func newUser() -> User? {
        guard let moc = CoreDataManager.default.managedObjectContext else { return nil }
        guard let userDesc = NSEntityDescription.entity(forEntityName: "User", in: moc) else { return nil}
        guard let user = NSManagedObject(entity: userDesc, insertInto: moc) as? User else { return nil }
        
        return user
    }
    
    func setAsOldUser(with context: NSManagedObjectContext? = nil) {
        guard let context = context else { return }
        self.firstTime = false
        do {
            try context.save()
        } catch let error {
            print("Error Updaing Record \(error)")
        }
    }
}
