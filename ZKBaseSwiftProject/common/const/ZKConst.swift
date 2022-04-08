//
//  ZKConst.swift
//  ZKBaseSwiftProject
//
//  Created by guina on 2021/6/18.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import Foundation
import UIKit

//MARK: - size
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenBounds = UIScreen.main.bounds

//MARK: - path
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
let kCachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last
let kTemporaryPath = NSTemporaryDirectory()

//MARK: -
let kAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
