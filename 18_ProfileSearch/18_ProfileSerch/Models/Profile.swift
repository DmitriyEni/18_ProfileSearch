//
//  Profile.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import Foundation
import ObjectMapper

class Content: Mappable {
    var content = [Profile]()
    var totalPages = 0
    var totalElements = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        content               <- map["content"]
        totalPages            <- map["totalPages"]
        totalElements         <- map["totalElements"]
    }
    
    
}

class Profile: Mappable {
    var displayName = ""
    var id = 0
    var city: String?
    var country: String?
    var description: String?
    var teamName: String?
    var avatarUrl: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        displayName     <- map["displayName"]
        city            <- map["city"]
        country         <- map["country"]
        teamName        <- map["teamName"]
        avatarUrl       <- map["profilePictureUrl"]
        description     <- map["description"]
    }
}
