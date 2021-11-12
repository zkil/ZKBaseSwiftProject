//
//  MJRefresh+Rx.swift
//  ZKBaseSwiftProject
//
//  Created by guina on 2021/6/18.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import RxSwift
import MJRefresh
import RxCocoa

extension Reactive where Base: MJRefreshComponent {
    var refreshing: ControlEvent<Void> {
        let source: Observable<Void> = Observable.create { [weak control = self.base] observer in
            if let control = control {
                control.refreshingBlock = {
                    observer.on(.next(()))
                }
            }
            
            return Disposables.create()
        }
        
        return ControlEvent(events: source)
    }
    
    var endRefreshing: Binder<Bool> {
        return Binder(base) { refresh, isEnd in
            if isEnd {
                refresh.endRefreshing()
            }
            
        }
    }
    
    
}
