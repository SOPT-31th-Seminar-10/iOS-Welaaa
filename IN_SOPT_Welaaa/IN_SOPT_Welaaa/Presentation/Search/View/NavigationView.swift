//
//  NavigationView.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

import SnapKit
import Then

final class NavigationView: BaseView {
    
    private lazy var backButton = UIButton().then {
        $0.setImage(Image.back, for: .normal)
    }
    
    private lazy var searchTextField = UITextField().then {
        $0.backgroundColor = Color.gray300
        $0.addLeftPadding()
        $0.makeRounded(radius: 8)
        $0.attributedPlaceholder = NSAttributedString(string: "제목, 저자나 강사명, 낭독자 이름",
                                                      attributes: [NSAttributedString.Key.foregroundColor: Color.gray400,
                                                                   NSAttributedString.Key.font: UIFont.font(.pretendardRegular, ofSize: 14)])
    }
    
    private lazy var underlineView = UIView().then {
        $0.backgroundColor = Color.gray300
    }
    
    override func setupView() {
        
        [backButton, searchTextField, underlineView]
            .forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.equalTo(self)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(20)
            $0.centerY.equalTo(self)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
