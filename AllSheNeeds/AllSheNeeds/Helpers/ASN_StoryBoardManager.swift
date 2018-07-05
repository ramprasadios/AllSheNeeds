//
//  ASN_StoryBoardManager.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 05/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

class ASN_StoryBoardManager {
    
    enum StoryBoardName: String {
        
        case userRegistration = "UserRegistrationModule"
        case home = "Home"
        
        var storyBoard: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: nil)
        }
    }
    
    enum VCIdentifier: String {
        case login = "LoginViewController"
        case sginup = "SignupViewController"
    }
    
    class var `default`: ASN_StoryBoardManager {
        struct Singleton {
            static let shared = ASN_StoryBoardManager()
        }
        return Singleton.shared
    }
    
    private init() { }
    
    func initViewController<T: UIViewController>(from storyBoard: StoryBoardName, with identifier: VCIdentifier) -> T {
        return storyBoard.storyBoard.instantiateViewController(withIdentifier: identifier.rawValue) as! T
    }
    
}

