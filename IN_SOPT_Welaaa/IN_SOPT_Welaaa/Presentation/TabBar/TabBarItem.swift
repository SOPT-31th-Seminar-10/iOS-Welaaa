//
//  TabBarItem.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case home
    case search
    case shelf
    case setting
}

extension TabBarItem {
    var title: String {
        switch self {
        case .home:         return "홈"
        case .search:        return "탐색"
        case .shelf:       return "내 서랍"
        case .setting:     return "관리"
        }
    }

    
    var inactiveIcon: UIImage? {
        switch self {
        case .home:   return Image.homeInactive
        case .search:     return Image.searchInactive
        case .shelf:   return Image.shelfInactive
        case .setting:     return Image.settingInactive
        }
    }
    
    var activeIcon: UIImage? {
        switch self {
        case .home:   return Image.homeActive
        case .search:     return Image.searchActive
        case .shelf:   return Image.shelfActive
        case .setting:     return Image.settingActive
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: inactiveIcon,
            selectedImage: activeIcon
        )
    }
}

