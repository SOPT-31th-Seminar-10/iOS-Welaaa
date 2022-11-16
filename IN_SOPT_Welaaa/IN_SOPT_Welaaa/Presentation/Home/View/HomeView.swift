//
//  HomeView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    private lazy var homeNavigationView = HomeNavigationView()
    
    
    
    override func setupView() {
        [homeNavigationView].forEach{
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        
        homeNavigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(66)
            $0.width.equalToSuperview()
        }
    }
    
}





//
//private var scrollView = UIScrollView()
//
//
//
//private var pagerTab = UIView().then {
//    $0.backgroundColor = .black
//}
//
//private var homeAdLargeImage = UIImageView().then {
//    $0.image = Image.home_ad_large
//}
//
//private var homaAdSmallImage = UIImageView().then {
//    $0.image = Image.home_ad_small
//}
