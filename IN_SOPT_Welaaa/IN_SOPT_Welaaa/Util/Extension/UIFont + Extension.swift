//
//  UIFont + Extension.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

extension UIFont {
    
    static func font(_ type: FontType, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }
}
