//
//  ASN_Constants.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation

class ASNConstants {
    
    enum UserState {
        case login, logout
    }
    
    enum ProfileActions: String {
        case myOrders = "My Orders"
        case feedback = "Feedback"
        case settings = "Settings"
        case logout = "Logout"
    }
    
    enum EventType {
        case productDetail
    }
    
    private init() {}
    
    static let genders = ["Male", "Female", "Other"]
    static let profileOptionsList = ["My Orders", "Feedback", "Settings", "Logout"]
    static let customerType = ["Company / Organization", "Student"]
    
    
    static let googleAPIKey = "447121333421-36bmljvr5q4hfn792r1rh50b2b04o0om.apps.googleusercontent.com"
    
    //CellIdentifiers:
    static let profileCellIdentifier = "ProfileCell"
}

extension ASNConstants.ProfileActions: CaseIterable {}
