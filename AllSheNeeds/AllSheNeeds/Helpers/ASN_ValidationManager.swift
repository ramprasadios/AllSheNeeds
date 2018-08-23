//
//  ASN_ValidationManager.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 16/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

class ValidationHandler {
    
    enum ValidationPage {
        case login, signup
    }
    
    enum ValidatingField: Int {
        case firstNameField = 101
        case lastNameField
        case emailField
        case genderField
        case dobField
        case phoneNumber
        case loginEmail
        case loginPassword
    }
    
    var validationPage: ValidationPage = .login
    var firstName: String?
    var lastName: String?
    var email: String?
    var gender: String?
    var dob: String?
    var phone: String?
    var loginUserName: String?
    var loginPassword: String?
    
    func validate(forPage validationPage: ValidationPage) -> (isValid: Bool, error: ValidationError) {
        switch validationPage {
        case .login:
            guard let email = self.loginUserName, !email.isEmpty else { return (false, ValidationError.emailEmpty)}
            guard let password = self.loginPassword, !password.isEmpty else { return (false, ValidationError.passwordEmpty) }
            guard email.isValidEmail else { return (false, ValidationError.inavlidEmail)}
            return (true, ValidationError.none)
        case .signup:
            return (false, ValidationError.firstNameEmpty)
        }
    }
    
    func updateModel(forField field: ValidatingField, withValue value: String) {
        switch field {
        case .firstNameField:
            self.firstName = value
        case .lastNameField:
            self.lastName = value
        case .emailField:
            self.email = value
        case .dobField:
            self.dob = value
        case .genderField:
            self.gender = value
        case .phoneNumber:
            self.phone = value
        case .loginEmail:
            self.loginUserName = value
        case .loginPassword:
            self.loginPassword = value
        }
    }
}
