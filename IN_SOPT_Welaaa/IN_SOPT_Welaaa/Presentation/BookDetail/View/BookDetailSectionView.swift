//
//  BookDetailSectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class BookDetailSectionView: UICollectionReusableView {

    static let identifier = "BookDetailSectionView"
    private let titleView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("BookDetailSectionView: fatal error")
    }
    
    private func setupView() {
        addSubview(titleView)
        titleView.addSubview(titleLabel)
    }

    private func setupConstraints() {
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(21)
        }
    }

    func setTitle(text: String) {
        self.titleLabel.text = text
    }
}

