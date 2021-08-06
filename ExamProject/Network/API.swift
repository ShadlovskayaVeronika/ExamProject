//
//  API.swift
//  ExamProject
//
//  Created by Veronika Shadlovskaya on 05.08.2021.
//

import Foundation
import Moya

enum API {
    case explore(Double,Double)
    case venues(String)
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.foursquare.com/v2/venues/") else {
            fatalError()
        }
        return url
    }
    
    var path: String{
        switch self {
        case .explore(_,_):
            return "explore"
        case .venues(let id):
            return "\(id)" //venues/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let client_id = Bundle.main.infoDictionary?["CLIENT_ID"] ?? ""
        let client_secret = Bundle.main.infoDictionary?["CLIENT_SECRET"] ?? ""
        switch self{
        case .explore(let latitude, let longitude):
            return .requestParameters(
                parameters: [
                    "ll": "\(latitude),\(longitude)",
                    //"limit": 30,
                    "sortByDistance": 1,
                    "client_id": client_id,
                    "client_secret": client_secret,
                    "v": "20210803"],
                encoding: URLEncoding.queryString )
        case .venues(let id):
            return .requestParameters(
                parameters: [
                    //"VENUE_ID": id,
                    "client_id": client_id,
                    "client_secret": client_secret,
                    "v": "20210803"],
                encoding: URLEncoding.queryString )
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
