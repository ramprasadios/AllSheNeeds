//
//  ProductFeaturesTableViewCell.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ProductFeaturesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var featureTitleLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var purchaseTypeView: UIView!
    @IBOutlet weak var quantityView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
