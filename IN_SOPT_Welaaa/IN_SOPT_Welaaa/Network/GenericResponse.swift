//
//  GenericResponse.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
        case status
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
    }
}
