//
//  RequestAlertPlugin.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2022/4/2
//  Copyright © 2022 吴泽凯. All rights reserved.
//
    

import Moya


//请求弹窗插件
final class RequestAlertPlugin: PluginType {
    
    //当前的视图控制器
//    private var viewController: UIViewController {
//        return UIApplication.appDeltegate.window!.rootViewController!.zk_top
//    }
     
   
    //插件初始化的时候传入当前的视图控制器
    init() {
        
    }
     
    //开始发起请求
    func willSend(_ request: RequestType, target: TargetType) {
        
    }
     
    //收到请求
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
//        switch result {
//        case .success(let resp):
//            guard let json = try? JSON(data: resp.data), let state = json["state"].int else {
//                return
//            }
//            //11, 58, 59, 60, 125, 3001, 4002
//            switch state {
//            case 162, 59:
//                ZKLoginUser.shared.clean()
//                let msg = json["message"].stringValue
//                UIApplication.appDeltegate.initRootViewController()
//                self.viewController.promptFor(title: "gameAmount65".wlLocalized, message: msg, cancelAction: "gameAmount49".wlLocalized, animated: true, completion: nil).subscribe { _ in
//
//                }.disposed(by: disposeBag)
//            default:
//                break
//            }
//        case .failure(let error):
//            if error.response?.statusCode == 401 {
//                ZKLoginUser.shared.clean()
//                UIApplication.appDeltegate.initRootViewController()
//
//            }
//        }
        
       
    }
}
