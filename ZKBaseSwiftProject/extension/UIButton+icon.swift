//
//  UIButton+icon.swift
//  ZKBaseSwiftProject
//
//  Created by guina on 2021/6/19.
//  Copyright © 2021 吴泽凯. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
             
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
             
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
        }
         
    private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
            spacing: CGFloat) {
        let imageSize = self.currentImage?.size ?? CGSize()
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
             
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
         
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + spacing/4),
                left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(imageSize.height + spacing/4), right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + spacing/4),
                left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: (titleSize.height + spacing/4), right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2 + spacing/2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                right: -(titleSize.width * 2 + spacing/2))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing/2)
            imageInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

         
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
        }
}
