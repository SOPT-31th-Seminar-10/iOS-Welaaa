//
//  StickyHeaderView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/25.
//

import UIKit

import SnapKit
import Then

final class StickyHeaderView: BaseView {
    
    
    private var pagerTab = UIView()
    
    private var infoBookLabel = UILabel().then {
        $0.text = "책 정보"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.green
    }
    
    private var infoBookSeparateLine = UIView().then {
        $0.backgroundColor = Color.green
    }
    
    private var indexPartLabel = UILabel().then {
        $0.text = "목차 13"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var reviewPartLabel =  UILabel().then {
        $0.text = "리뷰 444"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var separatorBar = UIView().then {
        $0.backgroundColor = Color.gray200
    }
    
    override func setupView() {
        [pagerTab, separatorBar].forEach {addSubview($0)}
        
        [infoBookLabel, indexPartLabel, reviewPartLabel, infoBookSeparateLine].forEach {
            pagerTab.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        pagerTab.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(42)
        }
        
        infoBookLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(69)
            $0.height.equalTo(40)
        }
        
        infoBookSeparateLine.snp.makeConstraints {
            $0.top.equalTo(self.pagerTab.snp.bottom).offset(1)
            $0.leading.equalTo(self.infoBookLabel)
            $0.width.equalTo(69)
            $0.height.equalTo(2)
        }
        
        indexPartLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.infoBookLabel.snp.trailing).offset(14)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
        
        reviewPartLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.indexPartLabel.snp.trailing).offset(14)
            $0.width.equalTo(65)
            $0.height.equalTo(40)
        }
        
        separatorBar.snp.makeConstraints {
            $0.top.equalTo(self.pagerTab.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(1)
        }
    }
}
