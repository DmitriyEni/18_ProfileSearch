//
//  BackandAPI.swift
//  18_ProfileSerch
//
//  Created by Dmitriy Eni on 07.04.2022.
//

import Foundation
import Moya

enum BackendAPI {
    case findAllUsers(name: String?)
    case getUserByID(id: Int)
}

extension BackendAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.squadix.co")!
    }
    
    var path: String {
        switch self {
        case .findAllUsers:
            return "/users"
        case .getUserByID(let id):
            return "/user/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserByID, .findAllUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        guard let params = params else {
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhY2Nlc3NUb2tlbiIsImlzcyI6InNxdWFkaXgtYXV0aCIsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJlbWFpbCI6Im1hc3RlckBnbWFpbC5jb20iLCJpYXQiOjE2NDkzNTQ5NDksImV4cCI6MTY1MTk0Njk0OX0.8dVn7HyiOEYt-USKnnydy5BjEgqQJAZ93gcV8ExjSP0"]
    }
    
    var params: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .findAllUsers(name: let name):
            params["name"] = name
        case .getUserByID:
            return nil
        }
        return params
    }
    
    var encoding: ParameterEncoding {
        switch self  {
        case .findAllUsers:
            return URLEncoding.queryString
        default:
            return JSONEncoding.prettyPrinted
        }
    }
}
