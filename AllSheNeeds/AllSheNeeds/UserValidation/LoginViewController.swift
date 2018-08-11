//
//  LoginViewController.swift
//  AllSheNeeds
//
//  Created by Sowmya Chada on 27/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

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
    
    @IBAction func facebookButtonTap(_ sender: Any) {
        let fbLoginManager: FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error == nil {
                if let fbLoginResult = result {
                    if fbLoginResult.isCancelled {
                        return
                    } else if fbLoginResult.grantedPermissions.contains("email") {
                        print("Authentication Successful")
                    }
                }
            }
        }
    }
    
    @IBAction func googleSigninTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().uiDelegate = self
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            GIDSignIn.sharedInstance().signOut()
        } else {
            GIDSignIn.sharedInstance().signIn()
        }
    }
}

extension LoginViewController: GIDSignInUIDelegate {
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
