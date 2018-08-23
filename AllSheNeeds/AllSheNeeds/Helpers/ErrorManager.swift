//
//  ErrorManager.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

enum ValidationError {
    case none
    case emailEmpty
    case inavlidEmail
    case passwordEmpty
    case firstNameEmpty
    case lastNameEmpty
    case mobileNumberEmpty
    case invalidMobileNumber
    case dateOfBirthEmpty
    case genderEmpty
    
    var localizedDescription: String {
        
        switch self {
        case .none:
            return ""
        case .emailEmpty:
            return NSLocalizedString("EMAIL_ADDRESS_EMPTY", comment: "")
        case .mobileNumberEmpty:
            return NSLocalizedString("MOBILE_NUMBER_EMPTY", comment: "")
        case .dateOfBirthEmpty:
            return NSLocalizedString("DOB_EMPTY", comment: "")
        case .firstNameEmpty:
            return NSLocalizedString("FIRST_NAME_EMPTY", comment: "")
        case .genderEmpty:
            return NSLocalizedString("GENDER_EMPTY", comment: "")
        case .inavlidEmail:
            return NSLocalizedString("INVALID_EMAIL", comment: "")
        case .invalidMobileNumber:
            return NSLocalizedString("INVALID_MOBILE", comment: "")
        case .lastNameEmpty:
            return NSLocalizedString("LAST_NAME_EMPTY", comment: "")
        case .passwordEmpty:
            return NSLocalizedString("PASSWORD_EMPTY", comment: "")
        }
    }
}
