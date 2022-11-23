//
//  HomeFooterAdView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/23.
//

import UIKit

import SnapKit
import Then

final class HomeFooterAdViewCell: UITableViewCell {
    
    static let identifier = "HomeFooterAdView"
    
    private var homeFooterAdImage = UIImageView().then {
        $0.image = Image.homeAdsFooter
    }
    
    private func setupView() {
        addSubview(homeFooterAdImage)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        homeFooterAdImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(204)
        }
    }
}

