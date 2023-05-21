//
//  CatsApi.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Moya

enum CatsApi {
    
    var apiKey: String {
        return "bda53789-d59e-46cd-9bc4-2936630fde39"
    }
    case getCats
}

extension CatsApi: TargetType {
    
    
    var baseURL: URL {
        return URL(string: "https://api.thecatapi.com")!
    }
    
    var path: String {
        switch self {
        case .getCats:
            return "/v1/breeds"
        }
    }
    
    var method: Method {
        switch self {
        case .getCats:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCats:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json", "x-api-key": apiKey]
    }
    
    public var sampleData: Data {
        switch self {
        case .getCats:
            return "[{\"name\": \"Florida\"}]".data(using: String.Encoding.utf8)!
        }
    }
}
