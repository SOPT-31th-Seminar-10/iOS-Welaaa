//
//  HomeAdView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeAdView: BaseView {
    
    private var pagerTab = UIView().then {
        $0.backgroundColor = .black
    }
    
    private var homeAdLargeImage = UIImageView().then {
        $0.image = Image.homeAdsLarge
    }
    
    private var homeAdSmallImage = UIImageView().then {
        $0.image = Image.homeAdsSmall
    }

    override func setupView() {
        [pagerTab, homeAdLargeImage, homeAdSmallImage].forEach{
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        
        pagerTab.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        homeAdLargeImage.snp.makeConstraints{
            $0.top.equalTo(self.pagerTab.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(260)
        }
        
        homeAdSmallImage.snp.makeConstraints{
            $0.top.equalTo(self.homeAdLargeImage.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(80)
        }
    }
}
