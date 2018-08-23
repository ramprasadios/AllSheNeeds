//
//  ContainerViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 22/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

protocol ChildEventHandlerProtocol: class {
    func eventTriggered(ofType type: ASNConstants.EventType)
}

class ContainerViewController: UIViewController {
    
    private weak var guestViewController: UIViewController!
    private var containerObjects = [String: UIViewController]()
    weak var baseViewController: UIViewController!
    
    private var currentViewController: UIViewController {
        get {
            return self.guestViewController
        }
    }
    
    private var segueIdentifier: String!
    
    //Life Cycle:
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.guestViewController != nil {
            self.guestViewController.view.removeFromSuperview()
            self.guestViewController = nil
        }
        
        if self.containerObjects[self.segueIdentifier] == nil {
            self.guestViewController = segue.destination
            self.containerObjects[self.segueIdentifier] = self.guestViewController
        } else {
            for (key, value) in self.containerObjects {
                if key == self.segueIdentifier {
                    self.guestViewController = value
                }
            }
        }
        
        if let guestVc = guestViewController as? ForHerProductsViewController {
            guestVc.eventHandlerDelegate = self.baseViewController as? ChildEventHandlerProtocol
        }
        
        self.addChildViewController(guestViewController)
        guestViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(guestViewController.view)
        guestViewController.didMove(toParentViewController: self)
    }
}

extension ContainerViewController {
    
    func performNavigation(with segueId: String) {
        self.segueIdentifier = segueId
        self.performSegue(withIdentifier: segueId, sender: nil)
    }
}
