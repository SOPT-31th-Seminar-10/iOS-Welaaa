//
//  Name.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/14.
//

import Foundation

struct Name {
    let name: String
}

extension Name {
    
    static func authorDummy() -> [Name] {
        return [
                Name(name: "이두온"),
                Name(name: "히가시노 게이고"),
                Name(name: "이민진"),
                Name(name: "박경리"),
                Name(name: "박해로"),
                Name(name: "이미애"),
                Name(name: "김동하"),
                Name(name: "이문열"),
                Name(name: "베르나르 베르베르")
        ]
    }
    
    static func actorDummy() -> [Name] {
        return [
            Name(name: "이미나"),
            Name(name: "남도형"),
            Name(name: "김상백"),
            Name(name: "김명준"),
            Name(name: "김나율"),
            Name(name: "장미"),
            Name(name: "권성혁"),
            Name(name: "박리나"),
            Name(name: "박요한"),
            Name(name: "서반석")
        ]
    }
}
