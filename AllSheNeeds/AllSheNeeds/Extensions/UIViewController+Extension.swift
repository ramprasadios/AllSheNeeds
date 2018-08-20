//
//  UIViewController+Extension.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showNormalAlert(withTitle title: String, andMessage msg: String) {
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showConfirmationAlert(title: String, message: String, okActionTitle: String, cancelTitle: String, confirmationHandler:@escaping ((_ clickedAlertAction: UIAlertAction, _ isDestructiveAction: Bool ) -> Void)) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okActionTitle, style: .default, handler: { action in
            confirmationHandler(action, true)
        })
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: { action in
            confirmationHandler(action, false)
        })
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
