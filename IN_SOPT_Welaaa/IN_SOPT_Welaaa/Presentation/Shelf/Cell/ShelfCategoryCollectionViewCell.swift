//
//  ShelfCategoryCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 최가연 on 2022/11/20.
//

import UIKit

class ShelfCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShelfCategoryCollectionViewCell"
    
    private let titleLabel = UILabel().then {
        $0.font = .font(.pretendardSemibold, ofSize:14)
        $0.textColor = Color.gray600
    }
    
    private let line = UIView().then {
        $0.backgroundColor = Color.gray600
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShelfCategoryCollectionViewCell {
    
    private func layout() {
        [titleLabel, line].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
        
    }
    

    func dataBind(title: String, isSelected: Bool) {
        titleLabel.text = title
        if isSelected {
            titleLabel.textColor = Color.green
            line.backgroundColor = Color.green
            line.isHidden = false
        } else {
            titleLabel.textColor = Color.gray600
            line.backgroundColor = Color.gray600
            line.isHidden = true
        }
    }
}

