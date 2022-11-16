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
    private lazy var homeAdView = HomeAdView()
    
    
    
    override func setupView() {
        [homeNavigationView, homeAdView].forEach{
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        
        homeNavigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        homeAdView.snp.makeConstraints {
            $0.top.equalTo(self.homeNavigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(406)
        }
    }
    
}
