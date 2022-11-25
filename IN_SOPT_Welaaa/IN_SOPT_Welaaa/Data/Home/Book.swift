//
//  Home.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/25.
//

import Foundation

struct Book: Codable {
    let book: [Book]
}

struct BookData: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let author: String
}
