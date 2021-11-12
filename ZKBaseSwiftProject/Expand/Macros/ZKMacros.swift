//
//  ZKMacros.swift
//  ZKBaseSwiftProject
//
//  Created by guina on 2021/6/18.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import Foundation
import UIKit

func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> UIColor {
    UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
}
