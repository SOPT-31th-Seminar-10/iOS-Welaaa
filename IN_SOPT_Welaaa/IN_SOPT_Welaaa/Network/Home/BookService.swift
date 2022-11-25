//
//  BookService.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/25.
//

import Foundation

import Moya

enum BookService {
    case getBook
}

extension BookService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getBook:
            return URLs.book
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBook:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getBook:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getBook:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
}

