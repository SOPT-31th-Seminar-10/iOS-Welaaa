//
//  PlaylistModel.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//


import Foundation
import UIKit

struct PlaylistModel {
    let bookImage : String?
    let title : String?
    let author : String?
    let progress : String?
    
}

var playlistDummyData: [PlaylistModel] = [
    PlaylistModel(bookImage: "파친코", title: "파친코", author: "이민진", progress: "32%"),
    PlaylistModel(bookImage: "파친코", title: "나미야 잡화점의 기억", author: "히가시노 게이고", progress: "50%"),
    PlaylistModel(bookImage: "파친코", title: "아몬드", author: "손원평", progress: "74%")
    ]
