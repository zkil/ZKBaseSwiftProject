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

class IndicatorPlugin: PluginType {

    //最顶层的视图控制器
//    private var viewController: UIViewController {
//        return UIApplication.appDeltegate.window!.rootViewController!.zk_top
//    }
     
    //活动状态指示器（菊花进度条）
    //private var spinner: UIActivityIndicatorView!
     
    //插件初始化的时候传入当前的视图控制器
    init() {
         
        //初始化活动状态指示器
//        if #available(iOS 13.0, *) {
//            self.spinner = UIActivityIndicatorView(style: .large)
//            self.spinner.backgroundColor = RGB(232, 232, 232)
//            self.spinner.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//            print(self.spinner.frame)
//        } else {
//            // Fallback on earlier versions
//            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
//            self.spinner.backgroundColor = RGB(232, 232, 232)
//        }
//        self.spinner.center = self.viewController.view.center
    }
     
    //开始发起请求
    func willSend(_ request: RequestType, target: TargetType) {
        //请求时在界面中央显示一个活动状态指示器
        DispatchQueue.main.async {
//            self.viewController.view.addSubview(self.spinner)
//            self.spinner.startAnimating()
//            ZKGameLoadingView.show()
        }
        
    }
     
    //收到请求
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
//        let disposeBag: DisposeBag = DisposeBag()
        //移除界面中央的活动状态指示器
        
         
        DispatchQueue.main.async {
//            self.spinner.removeFromSuperview()
//            self.spinner.stopAnimating()
//            ZKGameLoadingView.hide()
        }
//        guard case let Result.success(resp) = result, let json = try? JSON(data: resp.data) else {
//            return
//        }
//        
//        guard let state = json["state"].int else {
//            return
//        }
//        //11, 58, 59, 60, 125, 3001, 4002
//        switch state {
//        case 162,59:
//            ZKLoginUser.shared.clean()
//            let msg = json["message"].stringValue
//            UIApplication.appDeltegate.initRootViewController()
//            self.viewController.promptFor(title: "gameAmount65".wlLocalized, message: msg, cancelAction: "gameAmount49".wlLocalized, animated: true, completion: nil).subscribe { _ in
//                
//            }.disposed(by: disposeBag)
//        default:
//            break
//        }
        //只有请求错误时会继续往下执行
//            guard case let Result.failure(error) = result else { return }
//
//            //弹出并显示错误信息
//            let message = error.errorDescription ?? "未知错误"
//            let alertViewController = UIAlertController(title: "请求失败",
//                                                        message: "\(message)",
//                                                        preferredStyle: .alert)
//            alertViewController.addAction(UIAlertAction(title: "确定", style: .default,
//                                                        handler: nil))
//            viewController.present(alertViewController, animated: true)
    }
    
    
}
