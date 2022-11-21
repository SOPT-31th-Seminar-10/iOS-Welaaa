//
//  HomeSectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeSectionView: UICollectionReusableView {

    static let identifier = "HomeSectionView"

    private let titleLabel = UILabel().then {
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardMedium, ofSize: 20)
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
      
        addSubview(titleLabel)
    }

    private func setupConstraints() {

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.height.equalTo(40)
        }
    }

    func setTitle(text: String) {
        self.titleLabel.text = text
    }
}

