//
//  Category.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/23.
//

import Foundation

struct Category: Codable {
    let data: [CategoryData]
}

struct CategoryData: Codable {
    let id: Int
    let category, description: String
    let image: String
}
