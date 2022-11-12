//
//  UITabBar + Extension.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

public extension UITabBar {
    
    static func clearShadow() {
        
        UITabBar.appearance().shadowImage = nil
        UITabBar.appearance().backgroundImage = nil
        UITabBar.appearance().backgroundColor = Color.gray100
    }
}
