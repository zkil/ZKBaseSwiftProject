//
//  ZKBaseViewController.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2021/12/13.
//  Copyright © 2021 zk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import MBProgressHUD
protocol ZKViewControllerType {
    func initSubView()
    func layoutSubView()
    func bindViewModel()
}

class ZKBaseViewController: UIViewController, ZKViewControllerType, Navigatable {
    
    var viewModel: ZKViewModel!
    var navigator: Navigator!

    init(viewModel: ZKViewModel? = nil, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        rx.methodInvoked(#selector(UIViewController.viewDidLoad)).bind {  [unowned self] _ in
            self.initSubView()
            self.layoutSubView()
            self.bindViewModel()
        }.disposed(by: rx.disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        rx.methodInvoked(#selector(UIViewController.viewDidLoad)).bind {  [unowned self] _ in
            self.initSubView()
            self.layoutSubView()
            self.bindViewModel()
        }.disposed(by: rx.disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }
    
    
    
    
    func initSubView() {
        
    }
    
    func layoutSubView() {
        
    }
    
    func bindViewModel() {
        
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}





//import YYImage
//import RxCocoa
//import RxSwift
//class ZKGameLoadingView: ZKBaseView {
//    let loadingView: SDAnimatedImageView = {
//
//        let imgV = SDAnimatedImageView(image: SDAnimatedImage(named: "loading_icon.gif"))
//
//        //imgV.backgroundColor = .white
//        //imgV.contentMode = <#contentMode#>
//        return imgV
//    }()
//
//    static var shared: ZKGameLoadingView {
//        let window = UIApplication.appDeltegate.window
//        window?.addSubview(privateShared)
//        window?.bringSubviewToFront(privateShared)
//        privateShared.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        return privateShared
//    }
//
//    private static let privateShared: ZKGameLoadingView = {
//        let shared = ZKGameLoadingView()
//        return shared
//
//    }()
//
//    private init() {
//        super.init(frame: CGRect())
//        self.backgroundColor = RGB(0, 0, 0, 0.5)
//
//        addSubview(loadingView)
//        loadingView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            let screenWidth = kScreenWidth < kScreenHeight ? kScreenWidth : kScreenHeight
//            let width = screenWidth / 2
//            make.size.equalTo(CGSize(width: width, height: width * 240/310))
//            //make.size.equalTo(CGSize(width: 310, height: 240))
//        }
//
////        let isHiddenObserve = self.rx.observe(Bool.self, "isHedden").flatMapLatest{ isHidden -> Observable<Bool> in
////            guard let isHidden = isHidden else { return .never() }
////            return .just(isHidden)
////        }
//
//
//
//        relay.bind { i in
//            self.isHidden = i == 0
//        }.disposed(by: disposeBag)
//    }
//
//    //超时时间
//    let timeout = 120
//
//    let disposeBag = DisposeBag()
//    /// 锁
//    let lock = NSRecursiveLock()
//    /// 计数序列
//    let relay = BehaviorRelay(value: 0)
//    /// 增量计数
//    func increment() {
//        lock.lock()
//        relay.accept(relay.value + 1)
//        lock.unlock()
//    }
//    /// 减量计数
//    func decrement() {
//        lock.lock()
//        if relay.value != 0 {
//            relay.accept(relay.value - 1)
//        }
//
//        lock.unlock()
//    }
//
//    class func show() {
//        self.shared.increment()
//    }
//
//    class func hide() {
//        self.shared.decrement()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//


