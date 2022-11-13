//
//  SearchSectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/13.
//

import UIKit

import SnapKit
import Then

final class SearchSectionView: UICollectionReusableView {

    static let identifier = "SearchSectionView"

    private let titleLabel = UILabel().then {
        $0.textColor = Color.gray400
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("SearchSectionView: fatal error")
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
