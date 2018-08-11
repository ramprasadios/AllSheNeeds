//
//  NewUserViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 11/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit
import CoreData

class NewUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.handleUserNavigation()
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        guard let moc = CoreDataManager.default.managedObjectContext else { return }
        User.newUser()?.setAsOldUser(with: moc)
    }
    
}

extension NewUserViewController {
    
    func handleUserNavigation() {
        guard let user = User.getUser(), !user.firstTime else { return }
        self.setRootNavController(toType: .loginNavigation, ofStoryBoard: .login)
    }
}
