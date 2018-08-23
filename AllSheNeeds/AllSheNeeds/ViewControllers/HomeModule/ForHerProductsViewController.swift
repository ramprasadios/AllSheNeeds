//
//  ForHerProductsViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 23/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ForHerProductsViewController: UIViewController {
    
    weak var eventHandlerDelegate: ChildEventHandlerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func productDetailsTapped(_ sender: Any) {
        self.eventHandlerDelegate?.eventTriggered(ofType: .productDetail)
    }
}
