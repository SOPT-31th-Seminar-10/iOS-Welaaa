//
//  CategoryService.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/23.
//

import Foundation

import Moya

enum CategoryService {
    case getCategory
}

extension CategoryService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getCategory:
            return URLs.category
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCategory:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCategory:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getCategory:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}
