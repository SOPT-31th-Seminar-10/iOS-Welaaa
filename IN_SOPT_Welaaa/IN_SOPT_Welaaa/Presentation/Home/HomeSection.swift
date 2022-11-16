//
//  HomeSection.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import Foundation

enum HomeSection: Int, Equatable {
    case playlist
    case author
    case voice
    case category

    init(index: Int) {
        switch index {
        case 0: self = .playlist
        case 1: self = .author
        case 2: self = .voice
        default: self = .playlist
        }
    }

    var headerTitle: String {
        switch self {
        case .playlist:
            return "듣고 있던 오디오북! 계속 들어볼까요?"
        case .author:
            return "인기 저자 / 강사"
        case .voice:
            return "인기 성우"
        case .category:
            return "카테고리"
        }
    }
}

