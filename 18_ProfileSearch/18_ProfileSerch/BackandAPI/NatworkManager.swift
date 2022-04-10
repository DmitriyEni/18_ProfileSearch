//
//  NatworkManager.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import Foundation
import Moya
import Moya_ObjectMapper

class NetworkManager {
    static let provider = MoyaProvider<BackendAPI>(plugins: [NetworkLoggerPlugin()])
    
    class func getUserList(name: String? = nil, successBlock: (([Profile]) -> ())?, failureBlock: (() -> ())?) {
        provider.request(.findAllUsers(name: name)) { result in
            switch result {
                
            case .success(let response):
                guard let profiles = try? response.mapObject(Content.self) else {
                    failureBlock?()
                    return
                }
                successBlock?(profiles.content)
            case .failure(_):
                failureBlock?()
            }
        }
    }
    
    class func getUserByID(id: Int, successBlock: ((Profile) -> ())?, failureBlock: (() -> ())?) {
        provider.request(.getUserByID(id: id)) { result in
            switch result {
                
            case .success(let response):
                guard let profiles = try? response.mapObject(Profile.self) else {
                    failureBlock?()
                    return
                }
                successBlock?(profiles)
            case .failure(_):
                failureBlock?()
            }
        }
    }
}
