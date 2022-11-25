//
//  RelativeKeywordCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/23.
//

import UIKit

import SnapKit
import Then

final class RelatedKeywordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RelatedKeywordCollectionViewCell"
    
    let keywordLabel = UILabel().then {
      
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray600
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.width = ceil(size.width)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    private func setUI() {
        
        contentView.addSubview(keywordLabel)
        contentView.makeColorRounded(15, 1, Color.gray600)
    }
    
    private func setConstraints() {
        
        keywordLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func configureUI(name: Name) {
        keywordLabel.text = name.name
    }
}

