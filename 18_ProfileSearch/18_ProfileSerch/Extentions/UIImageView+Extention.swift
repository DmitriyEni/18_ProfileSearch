//
//  UIImageView+Extention.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromURL(_ url: String) {
        DispatchQueue.global().async {
            if let pictureUrl = URL(string: url) {
                if let data = try? Data(contentsOf: pictureUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.image = image

                        }
                    }
                }
            }
        }
    }
}
