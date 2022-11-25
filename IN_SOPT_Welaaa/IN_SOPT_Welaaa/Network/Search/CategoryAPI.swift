//
//  CategoryAPI.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/23.
//

import Foundation

import Moya

public class CategoryAPI {
    
    static let shared = CategoryAPI()
    
    public init() { }
    
    var bookProvider = MoyaProvider<BookService>()
    
    func getCategory(completion: @escaping (NetworkResult<Any>) -> Void) {
        bookProvider.request(.getBook) { result in
            switch result {
            case.success(let response):
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeCategoryStatus(by: statusCode, data)
                completion(networkResult)
    
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeCategoryStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(GenericResponse<[CategoryData]>.self, from: data) else {
            return .pathErr
        }
        
        switch statusCode {
        case 200:
            return .success(decodedData.data as Any)
        case 400..<500:
            return .requestErr(decodedData.message as Any)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
