//
//  MonthAudioBookCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class MonthAudioBookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MonthAudioBookCollectionViewCell"
    
    private lazy var bookImage = UIImageView().then {
        $0.makeRounded(radius: 8)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.gray800
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
    }
    
    private lazy var authorLabel = UILabel().then {
        $0.textColor = Color.gray600
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var infoBookLabel = UILabel().then {
        $0.textColor = Color.gray600
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.numberOfLines = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        [bookImage, titleLabel, authorLabel, infoBookLabel].forEach{
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        bookImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(163)
            $0.height.equalTo(239)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.bookImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalTo(163)
            $0.height.equalTo(21)
        }
        
        authorLabel.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalTo(163)
            $0.height.equalTo(21)
        }
        
        infoBookLabel.snp.makeConstraints{
            $0.top.equalTo(self.authorLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalTo(163)
            $0.height.equalTo(40)
        }
    }
    
    func dataBind(model: AudioBookModel){
        bookImage.image = UIImage(named: model.bookImage)
        titleLabel.text = model.title
        authorLabel.text = model.author
        infoBookLabel.text = model.infoLabel
    }
}
