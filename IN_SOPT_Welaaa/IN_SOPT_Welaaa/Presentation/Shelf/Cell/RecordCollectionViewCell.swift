//
//  RecordCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 최가연 on 2022/11/20.
//

import UIKit
import Then
import SnapKit

class RecordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecordCollectionViewCell"
    
    private let titleLabel = UILabel().then {
        $0.font = .font(.pretendardRegular, ofSize: 12)
        $0.textColor = Color.gray600
    }
    
    private let subLabel = UILabel().then {
        $0.font = .font(.pretendardMedium
                     , ofSize: 16)
        $0.textColor = Color.gray800
    }
    
    private let guidLine = UIView().then {
        $0.backgroundColor = Color.gray300
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

extension RecordCollectionViewCell {
    
    private func layout() {
        [titleLabel, subLabel, guidLine].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-19)
            $0.centerX.equalToSuperview()
        }
        
        guidLine.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.width.equalTo(1)
            $0.top.bottom.equalToSuperview().inset(12)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(title: String, content: String, isLined: Bool) {
        titleLabel.text = title
        subLabel.text = content
        if isLined {
            guidLine.isHidden = false
        } else {
            guidLine.isHidden = true
        }
    }
}

