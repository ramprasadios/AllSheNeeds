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
    
    private var validation: ValidationHandler = ValidationHandler()
    
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
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let result = self.validation.validate(forPage: .login)
        if result.isValid {
            print(result.error.localizedDescription)
            guard let user = User.getUser(), !user.firstTime else { return }
            user.setLoginStatus(with: .login)
            self.setRootNavController(toType: .homeNavigation, ofStoryBoard: .home)
        } else {
            self.showNormalAlert(withTitle: "Error...!", andMessage: result.error.localizedDescription)
            print(result.error.localizedDescription)
        }
    }
}

//MARK:- GIDSignInUIDelegate Methods
extension LoginViewController: GIDSignInUIDelegate {
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- UITextFieldDelegate Methods
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            let field = ValidationHandler.ValidatingField(rawValue: textField.tag)!
            self.validation.updateModel(forField: field, withValue: updatedText)
        }
        return true
    }
}

