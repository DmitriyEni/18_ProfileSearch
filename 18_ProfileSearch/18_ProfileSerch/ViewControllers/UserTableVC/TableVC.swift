//
//  TableVC.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import UIKit

class TableVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    var profiles = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: String(describing: PersonCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: PersonCell.self))
        spiner.startAnimating()
        
        NetworkManager.getUserList(name: nil) { profiles in
            self.profiles = profiles
            self.spiner.stopAnimating()
            self.tableView.reloadData()
        } failureBlock: {
            self.spiner.stopAnimating()
        }
    }
}

extension TableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonCell.self), for: indexPath) as! PersonCell
        cell.setupCell(profile: profiles[indexPath.row])
        return cell
        
    }
}

extension TableVC: UITableViewDelegate {
    
}
