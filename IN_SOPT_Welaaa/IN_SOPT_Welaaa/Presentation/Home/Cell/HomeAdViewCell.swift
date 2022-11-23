//
//  HomeAdView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeAdViewCell: UITableViewCell {
    
    static let identifier = "HomeAdView"
    
    private var pagerTab = UIView()
    
    private var audioBookPartView = UIImageView().then {
        $0.image = Image.homePagerTabAudioBookPart
    }
    
    private var webNovelPartView = UIImageView().then {
        $0.image = Image.homePagerTabWebNovelPart
    }
    
    private var classPartView = UIImageView().then {
        $0.image = Image.homePagerTabClassPart
    }

    private var homeAdLargeImage = UIImageView().then {
        $0.image = Image.homeAdsLarge
    }
    
    private var homeAdSmallImage = UIImageView().then {
        $0.image = Image.homeAdsSmall
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [pagerTab, homeAdLargeImage, homeAdSmallImage].forEach{
            addSubview($0)
        }
        
        [audioBookPartView, webNovelPartView, classPartView].forEach {
            pagerTab.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        pagerTab.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        audioBookPartView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(66)
            $0.height.equalTo(40)
        }
        
        webNovelPartView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.audioBookPartView.snp.trailing).offset(1)
            $0.width.equalTo(66)
            $0.height.equalTo(40)
        }
        
        classPartView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.webNovelPartView.snp.trailing).offset(1)
            $0.width.equalTo(66)
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
