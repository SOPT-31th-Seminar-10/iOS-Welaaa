//
//  HomeFooterAdView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/23.
//

import UIKit

import SnapKit
import Then

final class HomeFooterAdView: BaseView {
    
    private var homeFooterAdImage = UIImageView().then {
        $0.image = Image.homeAdsFooter
    }
    
    override func setupView() {
        addSubview(homeFooterAdImage)
    }
    
    
    override func setupConstraints() {
        homeFooterAdImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(204)
        }
    }
}

