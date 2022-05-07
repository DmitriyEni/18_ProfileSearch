//
//  PersonCell.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import UIKit

class PersonCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCell(profile: Profile) {
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = UIColor.black.cgColor
        nameLabel.text = profile.displayName
        selectionStyle = .none

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
        
        cityLabel.text = cityString
        
        if let avatarUrl = profile.avatarUrl {
            avatarImage.setImageFromURL(avatarUrl)
        }
        avatarImage.contentMode = .scaleAspectFill
    }
    
    override func prepareForReuse() {
        avatarImage.image = nil
    }
}


