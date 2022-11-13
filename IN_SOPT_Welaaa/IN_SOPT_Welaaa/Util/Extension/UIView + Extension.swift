//
//  UIView + Extension.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

extension UIView {
    
    public func makeRounded(radius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    public func makeColorRounded(_ radius: CGFloat, _ width: CGFloat, _ color: UIColor) {
        
        self.makeRounded(radius: radius)
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
