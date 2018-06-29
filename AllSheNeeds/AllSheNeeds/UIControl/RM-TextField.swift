//
//  RM-TextField.swift
//  SmartETicket
//
//  Created by Ramprasad A on 18/01/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

@objc
protocol DropDownHandlerProtocol: NSObjectProtocol {
    @objc func didSelect(rowAt indexPath: IndexPath, with text: String)
}

@IBDesignable
class RM_TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5);
    var leftImage: UIImage?
    
    var textFieldDataLabel: UILabel!
    var borderEnabled: Bool = true
    
    private var dropDownView: DropDownView?
    
    let datePicker: UIDatePicker = {
        let dateDropDown = UIDatePicker()
        dateDropDown.datePickerMode = .date
        dateDropDown.addTarget(self, action: #selector(RM_TextField.datePicekerChanged(sender:)), for: .valueChanged)
        return dateDropDown
    }()
    
    open var dataSource: [String] = [] {
        didSet {
            self.dropDownView?.dataSource = dataSource
        }
    }
    
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
    
    /// Textfield placeholder color
    @IBInspectable open var placeholderColor: UIColor? = UIColor.white.withAlphaComponent(0.5) {
        didSet {
            guard let placeholder = self.placeholder, let color = self.placeholderColor else { return }
            let attributes = [NSAttributedStringKey.foregroundColor: color]
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
    
    @IBInspectable open var isDropdown: Bool = false {
        didSet {
            if isDropdown {
                self.dropDownView = Bundle.main.loadNibNamed(DropDownView.nibName, owner: nil, options: nil)?.first as? DropDownView
                self.dropDownView?.dropDownTextFieldDelegate = self
                self.inputView = self.dropDownView
                self.reloadInputViews()
            } else {
                self.inputView = nil
                self.reloadInputViews()
            }
        }
    }
    
    @IBInspectable open var isDatePicker: Bool = false {
        didSet {
            if self.isDatePicker {
                self.inputView = self.datePicker
            }
            self.reloadInputViews()
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
        //self.setBottonBorder()
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
    
    @objc func datePicekerChanged(sender: UIDatePicker) {
        self.text = sender.date.description
    }
}

extension RM_TextField: DropDownHandlerProtocol {
    
    func didSelect(rowAt indexPath: IndexPath, with text: String) {
        self.endEditing(true)
        self.text = text
        print("Cell Selected")
    }
}

