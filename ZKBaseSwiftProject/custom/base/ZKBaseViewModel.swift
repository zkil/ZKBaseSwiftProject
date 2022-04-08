//
//  ZKBaseViewModel.swift
//  ZKBaseSwiftProject
//
//  Created by WL on 2021/12/13.
//  Copyright © 2021 zk. All rights reserved.
//

import UIKit
import RxSwift

protocol ZKBaseViewModelProtocol {
   
}



class ZKBaseViewModel: NSObject, ZKBaseViewModelProtocol {
    lazy var disposeBag = DisposeBag()
    
}
