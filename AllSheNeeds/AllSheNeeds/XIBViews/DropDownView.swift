//
//  DropDownView.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 29/06/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class DropDownView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var dropDownTextFieldDelegate: DropDownHandlerProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.register(DropDownTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension DropDownView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(forIndexPath: indexPath) as DropDownTableViewCell
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
}

extension DropDownView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dropDownTextFieldDelegate?.didSelect(rowAt: indexPath, with: self.dataSource[indexPath.row])
    }
}
