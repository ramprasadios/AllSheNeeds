//
//  UITableView+Extension.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ : T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell with Identifier: \(T.reusableIdentifier)")
        }
        return cell
    }
}
