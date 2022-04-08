//
//  ZKBaseView.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2021/12/13.
//  Copyright © 2021 zk. All rights reserved.
//

import UIKit
import RxSwift
protocol ZKBaseViewProtocol {
    func initSubView()
    func layoutSubView()
    func bindViewModel()
}

class ZKBaseView: UIView, ZKBaseViewProtocol {
    func initSubView() {
        
    }
    
    func layoutSubView() {
        
    }
    
    func bindViewModel() {
        
    }
    
    lazy var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initSubView()
        self.layoutSubView()
        self.bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubView()
        self.layoutSubView()
        self.bindViewModel()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
