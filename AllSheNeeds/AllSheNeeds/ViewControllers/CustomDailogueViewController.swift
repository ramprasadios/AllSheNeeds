//
//  CustomDailogueViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 11/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class CustomDailogueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dismissDailogueTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
