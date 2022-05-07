//
//  InfoVC.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 11.04.2022.
//

import UIKit

class InfoVC: UIViewController {
    var profile: Profile?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var describingLabel: UILabel!
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var tgImage: UIImageView!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var tgLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let profile = profile else {
            return
        }
        teamLabel.text = profile.teamName
        
        if let teamImageURL = profile.teamLogo {
            teamImage.setImageFromURL(teamImageURL)
        }
        teamImage.contentMode = .scaleAspectFill
        teamImage.layer.cornerRadius = teamImage.frame.height / 2
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 175/255, green: 185/255, blue: 154/255, alpha: 1.0)
        
        title = "Профиль"
        
        nameLabel.text = profile.displayName
        
        describingLabel.text = profile.description
        
        var cityString = ""
        if let country = profile.country {
            cityString += country
        }
        if let city = profile.city {
            if cityString.count > 0 {
                cityString += ", "
            }
            cityString += city
        }
        if cityString.count == 0 {
            cityString = "Город не указан"
        }
        cityLabel.text = cityString
        
        if let avatarUrl = profile.avatarUrl {
            avatarImage.setImageFromURL(avatarUrl)
        }
        avatarImage.contentMode = .scaleAspectFill
        
        guard let roles = profile.roles else {
            return
        }
        statusLabel.text = roles[0]
    }
}


