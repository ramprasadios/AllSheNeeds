//
//  ProductDetailViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 23/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
