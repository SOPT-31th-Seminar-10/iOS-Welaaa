//
//  CategoryCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/13.
//

import UIKit

import SnapKit
import Then

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var layerView = UIView().then {
        $0.makeColorRounded(8, 1, Color.green)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.gray900
        $0.text = "전체"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
    }
    
    private lazy var subtitleLabel = UILabel().then {
        $0.textColor = Color.gray400
        $0.text = "윌라의 오디오북을 한꺼번에 볼 수 있어.."
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var bookImage = UIImageView().then {
        $0.image = Image.bookImage
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private func setupView() {
        
        [titleLabel, subtitleLabel, layerView, bookImage]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        layerView.snp.makeConstraints {
            $0.height.equalTo(82)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(layerView.snp.top).inset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(20)
        }
        
        bookImage.snp.makeConstraints {
            $0.height.equalTo(93)
            $0.width.equalTo(66)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(1)
        }
    }
}

