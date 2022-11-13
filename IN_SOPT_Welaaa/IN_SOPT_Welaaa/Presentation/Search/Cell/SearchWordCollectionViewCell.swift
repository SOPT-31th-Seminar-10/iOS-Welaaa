//
//  SearchWordCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/13.
//

import UIKit

import SnapKit
import Then

final class SearchWordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SearchWordCollectionViewCell"

    private lazy var rankView = UIImageView().then {
        $0.image = Image.searchRank
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var adsImageView = UIImageView().then {
        $0.image = Image.audioAds
        $0.makeRounded(radius: 8)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        [rankView, adsImageView]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setConstraints() {
        
        rankView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(self)
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
            $0.height.equalTo(126)
        }
        
        adsImageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self)
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
            $0.height.equalTo(134)
            $0.top.equalTo(rankView.snp.bottom).offset(28)
        }
    }
}

