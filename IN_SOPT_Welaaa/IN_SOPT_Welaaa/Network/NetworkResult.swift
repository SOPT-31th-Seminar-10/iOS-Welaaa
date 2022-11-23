//
//  NetworkResult.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/23.
//

import Foundation

enum NetworkResult<T> {
  case success(T)
  case requestErr(T)
  case pathErr
  case serverErr
  case networkFail   
}
