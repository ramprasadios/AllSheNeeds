//
//  String+Extension.swift
//  SmartETicket
//
//  Created by Ramprasad A on 13/07/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    private enum StringValidation {
        case email
        case phoneNumber
    }
    
    private func isValid(type: StringValidation) -> Bool {
        
        var regularExp = ""
        switch type {
        case .email:
            regularExp = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        case .phoneNumber:
            regularExp = "[789][0-9]{9}"
        }
        let test = NSPredicate(format:"SELF MATCHES %@", regularExp)
        return test.evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        return self.isValid(type: .email)
    }
    
    var isPhoneNumber: Bool {
        return (self.count == 10) || (self.count == 11)
    }
}
