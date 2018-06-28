//
//  RM-TextField.swift
//  SmartETicket
//
//  Created by Ramprasad A on 18/01/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

protocol TextFieldInteractionDelegate: class {
    func textFieldBegin()
    func textFieldCharacterChange(withString string: String)
}

@IBDesignable
class RM_TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5);
    var leftImage: UIImage?
    
    var textFieldDataLabel: UILabel!
    var borderEnabled: Bool = true
    
    @IBInspectable var leftViewImage: UIImage? {
        get {
            return self.leftImage
        } set {
            self.leftImage = newValue
            self.addLeftView()
        }
    }
    
    @IBInspectable var isBorderHidden: Bool {
        get {
            return self.borderEnabled
        }
        set {
            self.borderEnabled = newValue
            self.setBottonBorder()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialUISetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialUISetup()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

//MARK:- Initial Setup Methods
extension RM_TextField {
    
    func initialUISetup() {
        self.setBottonBorder()
    }
    
    func setBottonBorder() {
        if !self.isBorderHidden {
            self.borderStyle = .none
            
            let border = CALayer()
            let width = CGFloat(2.0)
            border.borderColor = UIColor.gray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
            self.setNeedsDisplay()
        }
    }
    
    func addLeftView() {
        self.leftViewMode = .always
        
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)
        
        guard let iconImage = self.leftViewImage else { return }
        
        let imageView = UIImageView(image: iconImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)

        self.leftView = mainView
    }
}

