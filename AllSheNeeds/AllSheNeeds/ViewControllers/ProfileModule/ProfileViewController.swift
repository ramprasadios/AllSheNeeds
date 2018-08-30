//
//  ProfileViewController.swift
//  AllSheNeeds
//
//  Created by Ramprasad A on 20/08/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileDataTableView: UITableView!

    var profileViewModel = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let tableHeaderView = profileDataTableView.tableHeaderView {
            let height = tableHeaderView.systemLayoutSizeFitting(UILayoutFittingExpandedSize).height
            var headerFrame = tableHeaderView.frame
            
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                tableHeaderView.frame = headerFrame
                profileDataTableView.tableHeaderView = tableHeaderView
            }
        }
    }
    
    func initalSetup() {
        guard let headerView = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return }
        self.profileDataTableView.tableHeaderView = headerView
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ASNConstants.profileCellIdentifier, for: indexPath)
        cell.textLabel?.text = profileViewModel.profileOptions[indexPath.row].rawValue
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.handleUserAction(with: self.profileViewModel.profileOptions[indexPath.row])
    }
}

extension ProfileViewController {
    
    func handleUserAction(with type: ASNConstants.ProfileActions) {
        switch type {
        case .logout:
            ASN_AppManager.logoutUser()
            self.setRootNavController(toType: .loginNavigation, ofStoryBoard: .login)
        case .myCart:
            let cartVc = self.instantinateViewController(ofType: .cartVc, of: .home)
            self.navigationController?.pushViewController(cartVc, animated: true)
        default:
            break
        }
    }
}
