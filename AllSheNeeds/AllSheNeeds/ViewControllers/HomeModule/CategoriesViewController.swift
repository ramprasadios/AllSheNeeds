//
//  CategoriesViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 28/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var productCategoriesTableView: UITableView!
    @IBOutlet weak var upcomingProductsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
        self.title = "Product Categories"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

//MARK:- Helper Methods:
extension CategoriesViewController {
    
    func registerNibs() {
        let upcomingCellNib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        self.upcomingProductsCollectionView.register(upcomingCellNib, forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
    }
}

//MARK:- UITableViewDataSource Methods
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCategoriesCell", for: indexPath)
        cell.textLabel?.text = "Product Name \(indexPath.row)"
        
        return cell
    }
}

//MARK:- UITableViewDelegate Methods
extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.productCategoriesTableView.bounds.height / 5 - 2.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVc = self.instantinateViewController(ofType: .prodDetails, of: .home)
        self.navigationController?.pushViewController(productDetailVc, animated: true)
    }
}

//MARK:- UICollectionViewDataSource Methods
extension CategoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell", for: indexPath) as? UpcomingCollectionViewCell
        return cell!
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.upcomingProductsCollectionView.bounds.height * 0.8
        let width = self.view.frame.width * 0.3
        return CGSize(width: width, height: height)
    }
}
