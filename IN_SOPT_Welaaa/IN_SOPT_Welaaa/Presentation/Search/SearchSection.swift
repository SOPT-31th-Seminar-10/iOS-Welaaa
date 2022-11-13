//
//  SearchSection.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/14.
//

import Foundation

enum SearchSection: Int, Equatable {
    case search
    case author
    case voice
    case category

    init(index: Int) {
        switch index {
        case 0: self = .search
        case 1: self = .author
        case 2: self = .voice
        default: self = .category
        }
    }

    var headerTitle: String {
        switch self {
        case .search:
            return "인기 검색어"
        case .author:
            return "인기 저자 / 강사"
        case .voice:
            return "인기 성우"
        case .category:
            return "카테고리"
        }
    }
}

