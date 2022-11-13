//
//  KeywordCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/13.
//

import UIKit

import SnapKit
import Then

final class KeywordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeywordCollectionViewCell"
    
    let keywordLabel = UILabel().then {
      
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
        $0.textColor = Color.green
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
        contentView.makeColorRounded(4, 1, Color.green)
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

