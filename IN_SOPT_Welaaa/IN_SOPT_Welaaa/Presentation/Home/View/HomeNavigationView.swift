//
//  NavigationView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationView: BaseView {
    
    private lazy var logoImage = UIImageView().then{
        $0.image = Image.logo
    }
    
    private lazy var alertButton = UIButton().then {
        $0.setImage(Image.alert, for: .normal)
    }
    
    override func setupView() {
        [logoImage, alertButton]
            .forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        logoImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(26)
        }
        
        alertButton.snp.makeConstraints {
            $0.leading.equalTo(self.logoImage.snp.trailing).offset(264.03)
            $0.top.equalToSuperview().offset(22)
            $0.width.equalTo(17.96)
            $0.height.equalTo(19.51)
        }
    }
}



