//
//  LoginViewController.swift
//  AllSheNeeds
//
//  Created by Sowmya Chada on 27/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.layer.contents = UIImage(named: "ASN_BG_IMG")?.cgImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        self.navigationController?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ASN_ARROW_LEFT")
        self.navigationController?.navigationBar.backItem?.title = ""

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
