//
//  SignupViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 27/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var genderTextField: RM_TextField!
    @IBOutlet weak var dobTextField: RM_TextField!
    @IBOutlet weak var occupationTextField: RM_TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genderTextField.dataSource = ASNConstants.genders
        self.occupationTextField.dataSource = ASNConstants.customerType
        self.dobTextField.datePicker.maximumDate = Date()
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

