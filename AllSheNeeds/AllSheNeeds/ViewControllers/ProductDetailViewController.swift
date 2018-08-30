//
//  ProductDetailViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 23/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func registerNibs() {
        
        self.productDetailTableView.estimatedRowHeight = 20.0
        self.productDetailTableView.rowHeight = UITableViewAutomaticDimension
        
        let nib1 = UINib(nibName: "ProductImageTableViewCell", bundle: nil)
        self.productDetailTableView.register(nib1, forCellReuseIdentifier: "ProductImageTableViewCell")
        
        let nib2 = UINib(nibName: "ProductNameTableViewCell", bundle: nil)
        self.productDetailTableView.register(nib2, forCellReuseIdentifier: "ProductNameTableViewCell")
        
        let nib3 = UINib(nibName: "ProductFeaturesTableViewCell", bundle: nil)
        self.productDetailTableView.register(nib3, forCellReuseIdentifier: "ProductFeaturesTableViewCell")
        
        let nib4 = UINib(nibName: "ProductDescriptionTableViewCell", bundle: nil)
        self.productDetailTableView.register(nib4, forCellReuseIdentifier: "ProductDescriptionTableViewCell")
        
        let nib5 = UINib(nibName: "AddToCartTableViewCell", bundle: nil)
        self.productDetailTableView.register(nib5, forCellReuseIdentifier: "AddToCartTableViewCell")
    }
}

extension ProductDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 2) ? 2 : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeCell(forIndexPath: indexPath) as ProductImageTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeCell(forIndexPath: indexPath) as ProductNameTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeCell(forIndexPath: indexPath) as ProductFeaturesTableViewCell
            if indexPath.row == 0 {
                cell.featureTitleLabel.text = "Storage Capacity :"
                cell.purchaseTypeView.isHidden = true
                cell.quantityView.isHidden = false
            } else {
                cell.featureTitleLabel.text = "Purchase Type :"
                cell.purchaseTypeView.isHidden = false
                cell.quantityView.isHidden = true
            }
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeCell(forIndexPath: indexPath) as ProductDescriptionTableViewCell
            return cell
        } else {
            let cell = tableView.dequeCell(forIndexPath: indexPath) as AddToCartTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2:
            return "Features"
        case 3:
            return "Product Description"
        default:
            return ""
        }
    }
}

extension ProductDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if ((section == 0) || (section == 1) || (section == 4)) {
            return 0.0
        } else {
            return 45.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 45.0
        } else if indexPath.section == 0 {
            return self.productDetailTableView.frame.height * 0.6
        } else if indexPath.section == 4 {
            return 60.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
}
