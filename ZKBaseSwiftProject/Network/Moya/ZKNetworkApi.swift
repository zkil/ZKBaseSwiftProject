//
//  ZKNetworkApi.swift
//  ZKBaseSwiftProject
//
//  Created by guina on 2021/8/24.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import Foundation
import Moya
import Alamofire

let baseURLString = "";
let ZKProvider = MoyaProvider<ZKNetWorkApi>()

enum ZKNetWorkApi {
    case request(baseUrl: String = baseURLString, path: String, method: Moya.Method, params: [String: Any] = [:])
    case post(baseUrl: String = baseURLString, path: String, params: [String: Any] = [:])
    case get(baseUrl: String = baseURLString, path: String, params: [String: Any] = [:])
}

extension ZKNetWorkApi: TargetType {
    var baseURL: URL {
        URL(string: self.info.0)!
    }
    
    var path: String {
        self.info.1
    }
    
    var method: Moya.Method {
        self.info.2
    }
    
    //单元测试
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestParameters(parameters: self.info.3, encoding: Alamofire.URLEncoding.default)
    }
    
    var headers: [String : String]? {
        nil
    }
    
}


extension ZKNetWorkApi {
    var info: (String, String, Moya.Method, [String: Any]) {
        switch self {
        case .request(let baseUrl, let path, let method, let params):
            return (baseUrl, path, method, params)
        case .post(let baseUrl, let path, let params):
            return (baseUrl, path, .post, params)
        case .get(let baseUrl, let path, let params):
            return (baseUrl, path, .get, params)
//        default:
//            return ("", "", .get, [:])
        }
    }
}
