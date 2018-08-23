//
//  ASN_Protocols.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInstantinatable {
    func instantinateViewController<T: UIViewController>(ofType type: ViewControllerType, of storyBoard: StoryBoardType) -> T
}

protocol RootSwitchable {
    func setRootNavController(toType type: NavigationControllerType, ofStoryBoard storyBoard: StoryBoardType)
}

extension UIViewController: StoryBoardInstantinatable { }
extension UIViewController: RootSwitchable { }

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

public protocol CaseIterable {
    associatedtype AllCases: Collection where AllCases.Element == Self
    static var allCases: AllCases { get }
}

extension CaseIterable where Self: Hashable {
    static var allCases: [Self] {
        return [Self](AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            var first: Self?
            return AnyIterator {
                let current = withUnsafeBytes(of: &raw) { $0.load(as: Self.self) }
                if raw == 0 {
                    first = current
                } else if current == first {
                    return nil
                }
                raw += 1
                return current
            }
        })
    }
}
