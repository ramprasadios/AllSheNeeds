//
//  StoryBoardManager.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 11/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

enum NavigationControllerType: String {
    case loginNavigation = "LoginNavigationController"
    case homeNavigation = "HomeTabBarController"
}

enum ViewControllerType: String {
    
    case login = "LoginViewController"
    case signup = "RegistrationViewController"
}

enum StoryBoardType: String {
    case home = "Home"
    case login = "UserRegistrationModule"
    
    var storyBoard: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

///Instantinates the ViewController Based on the Parameter Values
///From Respective StoryBoards
extension StoryBoardInstantinatable where Self: UIViewController {
    
    func instantinateViewController<T: UIViewController>(ofType type: ViewControllerType, of storyBoard: StoryBoardType) -> T {
        return storyBoard.storyBoard.instantiateViewController(withIdentifier: type.rawValue) as! T
    }
}

///Helps to Switch Between the Navigation Controller
extension RootSwitchable where Self: UIViewController {
    
    func setRootNavController(toType type: NavigationControllerType, ofStoryBoard storyBoard: StoryBoardType) {
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { return }
        let rootVc = storyBoard.storyBoard.instantiateViewController(withIdentifier: type.rawValue)
        appDelegate.window?.rootViewController = rootVc
    }
}
