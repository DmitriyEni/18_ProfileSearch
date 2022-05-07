//
//  TableVC.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import UIKit

class TableVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spiner:UIActivityIndicatorView!
    @IBOutlet weak var searchField: UITextField!
    var timer: Timer?
    var profiles = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: String(describing: PersonCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: PersonCell.self))
        
        searchField.addTarget(self, action: #selector(textDidChange), for: .allEvents)
        
        spiner.startAnimating()
        NetworkManager.getUserList { profiles in
            self.profiles = profiles
            self.spiner.stopAnimating()
            self.tableView.reloadData()
        } failureBlock: {
            self.spiner.stopAnimating()
        }
    }
    
    @objc func textDidChange() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            self.spiner.startAnimating()
            NetworkManager.getUserList(name: self.searchField.text) { profiles in
                self.profiles = profiles
                self.spiner.stopAnimating()
                self.tableView.reloadData()
            } failureBlock: {
                self.spiner.stopAnimating()
            }
        })
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userProfile = profiles[indexPath.row]
        let infoVC = InfoVC(nibName: String(describing: InfoVC.self), bundle: nil)
        infoVC.profile = userProfile
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

extension TableVC: UITableViewDelegate {
    
}
