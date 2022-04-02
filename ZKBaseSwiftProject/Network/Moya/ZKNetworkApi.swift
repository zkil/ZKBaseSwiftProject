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
let ZKProvider = MoyaProvider<ZKNetWorkApi>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter), logOptions: .verbose)), RequestAlertPlugin()])

var serverHeaders: [String : String] {
/*
    let token = ZKLoginUser.shared.model?.token ?? ""
   //print([ "lang": "zh-cn", "pl": "ios", "Authorization": token ])
    var lang = "th"
    if WLLanguageManager.shared.currentLanguage == "zh-Hans" {
        lang = "zh-cn"
    }
    
    
    return [ "lang": lang, "pl": "ios", "Authorization": token ]
*/
    return [:]
}

enum ZKNetWorkApi {
    case info
}

extension ZKNetWorkApi: TargetType {
    var baseURL: URL {
        URL(string: baseURLString)!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    //单元测试
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestParameters(parameters: [:], encoding: Alamofire.URLEncoding.default)
    }
    
    var headers: [String : String]? {
        serverHeaders
    }
    
}

// MARK: - log
private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        
        
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}
