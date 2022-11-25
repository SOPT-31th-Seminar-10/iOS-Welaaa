//
//  BookCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 최가연 on 2022/11/20.
//

import UIKit

import Kingfisher
import SnapKit
import Then

class BookCollectionViewCell: UICollectionViewCell {
     
    static let identifier = "BookCollectionViewCell"
    
    private let bookImage = UIImageView()
    
    private let bookNameLabel = UILabel().then {
        $0.font = .font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray600
    }
    
    private let authorName = UILabel().then {
        $0.font = .font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray600
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookCollectionViewCell {
    
    private func layout() {
        [bookImage, bookNameLabel, authorName].forEach {
            contentView.addSubview($0)
        }
        
        bookImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(154)
        }
        
        bookNameLabel.snp.makeConstraints {
            $0.top.equalTo(bookImage.snp.bottom).offset(10)
            $0.leading.equalTo(bookImage)
        }
        
        authorName.snp.makeConstraints {
            $0.top.equalTo(bookNameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }
    
    func dataBind(model: BookDto) {
        bookNameLabel.text = model.title
        authorName.text = model.author
        if let url = URL(string: model.image) {
            bookImage.kf.setImage(with: url)
        }
    }
}
