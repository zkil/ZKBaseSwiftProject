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


extension Reactive where Base: UIViewController {
    var viewDidLoad: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in }
        return ControlEvent(events: source)
    }
     
    var viewWillAppear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear))
            .map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
    var viewDidAppear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewDidAppear))
            .map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
     
    var viewWillDisappear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewWillDisappear))
            .map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
    var viewDidDisappear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewDidDisappear))
            .map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
     
    public var viewWillLayoutSubviews: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews))
            .map { _ in }
        return ControlEvent(events: source)
    }
    var viewDidLayoutSubviews: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews))
            .map { _ in }
        return ControlEvent(events: source)
    }
     
    var willMoveToParentViewController: ControlEvent<UIViewController?> {
        let source = self.methodInvoked(#selector(Base.willMove))
            .map { $0.first as? UIViewController }
        return ControlEvent(events: source)
    }
    public var didMoveToParentViewController: ControlEvent<UIViewController?> {
        let source = self.methodInvoked(#selector(Base.didMove))
            .map { $0.first as? UIViewController }
        return ControlEvent(events: source)
    }
     
    var didReceiveMemoryWarning: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.didReceiveMemoryWarning))
            .map { _ in }
        return ControlEvent(events: source)
    }
     
    //表示视图是否显示的可观察序列，当VC显示状态改变时会触发
    var isVisible: Observable<Bool> {
        let viewDidAppearObservable = self.base.rx.viewDidAppear.map { _ in true }
        let viewWillDisappearObservable = self.base.rx.viewWillDisappear
            .map { _ in false }
        return Observable<Bool>.merge(viewDidAppearObservable,
                                      viewWillDisappearObservable)
    }
     
    //表示页面被释放的可观察序列，当VC被dismiss时会触发
    var isDismissing: ControlEvent<Bool> {
        let source = self.sentMessage(#selector(Base.dismiss))
            .map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
}
