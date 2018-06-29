//
//  ASN_Protocols.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: NibLoadableView {}

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
