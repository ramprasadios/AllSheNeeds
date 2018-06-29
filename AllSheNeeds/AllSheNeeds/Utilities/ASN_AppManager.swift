//
//  ASN_AppManager.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 27/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ASN_AppManager: NSObject {
    
    static func configureDependancy() {
        self.configureKeyBoardManager()
    }

    private static func configureKeyBoardManager() {
        
        IQKeyboardManager.shared.enable = true
    }
}
