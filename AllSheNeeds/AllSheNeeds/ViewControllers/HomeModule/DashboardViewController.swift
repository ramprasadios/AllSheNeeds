//
//  DashboardViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 20/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var containerVc: ContainerViewController?
    
    @IBOutlet var myButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerVc?.performNavigation(with: "ForShe")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Container" {
            guard let containerVc = segue.destination as? ContainerViewController else { return }
            self.containerVc = containerVc
            containerVc.baseViewController = self
        }
    }
    
    @IBAction func changePurchaseType(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        button.setTitleColor(UIColor.black, for: .normal)
        for otherButtons in self.myButtons {
            if otherButtons.tag != button.tag {
                otherButtons.setTitleColor(UIColor.white, for: .normal)
            }
        }
        
        switch button.tag {
        case 101:
            self.containerVc?.performNavigation(with: "ForShe")
        case 102:
            self.containerVc?.performNavigation(with: "ForKids")
        case 103:
            self.containerVc?.performNavigation(with: "Upcoming")
        default:
            break
        }
    }
}

extension DashboardViewController: ChildEventHandlerProtocol {
    
    func eventTriggered(ofType type: ASNConstants.EventType) {
        let productDetailVc = self.instantinateViewController(ofType: .categories, of: .home)
        self.navigationController?.pushViewController(productDetailVc, animated: true)
    }
}
