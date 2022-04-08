//
//  UIViewController+ext.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2022/4/8
//  Copyright © 2022 吴泽凯. All rights reserved.
//
    

import Foundation
import UIKit

extension UIApplication {
    class var appDeltegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var currentWindow: UIWindow {
        if #available(iOS 15, *) {
            return UIApplication.shared.connectedScenes
                .filter{ $0.activationState == .foregroundActive  }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })!.windows.first(where: \.isKeyWindow)!
        } else {
            return UIApplication.shared.windows.first(where: \.isKeyWindow)!
        }
    }
}

extension UIViewController {
    //获取顶部viewController
    class func zk_top() -> UIViewController {
        return UIApplication.shared.currentWindow.rootViewController!.zk_top
    }

    var zk_top: UIViewController {
        var viewC: UIViewController = self
        if let navigC = self as? UINavigationController, let topVC = navigC.topViewController {
            viewC = topVC.zk_top
        } else if let tabC = self as? UITabBarController, let topVC = tabC.selectedViewController {
            viewC = topVC.zk_top
        } else if let presentedViewController = presentedViewController {
            viewC = presentedViewController.zk_top
        }
        return viewC
    }
    
    
    

}
