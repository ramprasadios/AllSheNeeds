//
//  SignupViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 27/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignupViewController {

}

