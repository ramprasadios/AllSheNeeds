//
//  CoreDataManager.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 11/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager: NSObject {
    
    class var `default`: CoreDataManager {
        struct Singleton {
            static var instance = CoreDataManager()
        }
        return Singleton.instance
    }
    
    private override init() {}
    
    var managedObjectContext: NSManagedObjectContext? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
}
