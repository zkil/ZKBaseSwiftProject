//
//  UIViewController+Rx.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2022/4/8
//  Copyright © 2022 吴泽凯. All rights reserved.
//
    

import Foundation
import RxSwift
import UIKit
import RxCocoa

extension Reactive where Base: UIViewController {
    func promptFor<Action: CustomStringConvertible>(title: String? = nil, message: String? = nil, cancelAction: Action, actions: [Action]? = nil, animated: Bool = true, completion: (() -> Void)? = nil) -> Observable<Int> {
            return Observable.create({ (observer) -> Disposable in
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: cancelAction.description, style: .cancel, handler: { (_) in
                    observer.onNext(0)
                }))
                
                if let  actions = actions {
                    for (index, action) in actions.enumerated() {
                        alert.addAction(UIAlertAction(title: action.description, style: .default, handler: { (_) in
                            observer.onNext(index + 1)
                        }))
                    }
                }
                
                self.base.present(alert, animated: animated, completion: nil)
                
                return Disposables.create { [weak alert] in
                    alert?.dismiss(animated: animated, completion: completion)
                }
            })
    }
}

extension Reactive where Base: UIViewController {
    var promptText: Binder<String> {
        return Binder(base){ vc, text in
            vc.showHUDMessage(text)
        }
    }
    
    var hud: Binder<String> {
        return Binder(base){ vc, text in
            if text.isEmpty {
                vc.hideHUD()
            } else {
                vc.showHUD(withMessage: text)
            }
            
        }
    }
    
    var loading: Binder<Bool> {
        return Binder(base){ vc, isLoading in
            if isLoading {
                //ZKGameLoadingView.show()
            } else {
                //ZKGameLoadingView.hide()
            }
        }
    }
}
