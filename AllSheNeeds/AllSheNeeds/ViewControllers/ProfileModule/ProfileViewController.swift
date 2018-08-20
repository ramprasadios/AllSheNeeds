//
//  ProfileViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 20/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        guard let user = User.getUser(), !user.firstTime else { return }
        user.setLoginStatus(with: .logout)
        self.setRootNavController(toType: .loginNavigation, ofStoryBoard: .login)
    }
}
