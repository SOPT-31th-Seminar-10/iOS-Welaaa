//
//  PlaylistCollectionHeaderView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/17.
//

import UIKit

import SnapKit
import Then

final class PlaylistCollectionHeaderView: UICollectionReusableView {

    static let identifier = "PlaylistCollectionHeaderView"

    private let titleLabel = UILabel().then {
        $0.text = "듣고 있던 오디오북! 계속 들어볼까요?"
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
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
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}

