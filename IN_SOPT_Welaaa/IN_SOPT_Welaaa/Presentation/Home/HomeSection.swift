//
//  HomeSection.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import Foundation

enum HomeSection: Int, Equatable {
    case playlist
    case recommand
    case month
    case recently
    case none

    init(index: Int) {
        switch index {
        case 2: self = .playlist
        case 3: self = .recommand
        case 4: self = .month
        case 5: self = .recently
        default: self = .none
            
        }
    }

    var headerTitle: String {
        switch self {
        case .playlist:
            return "듣고 있던 오디오북! 계속 들어볼까요?"
        case .recommand:
            return "반유진님이 좋아할 만한 오디오북"
        case .month:
            return "이 달의 오디오북"
        case .recently:
            return "지금 막 녹음을 끝낸 오디오북"
        default:
            return ""
        }
    }
}

