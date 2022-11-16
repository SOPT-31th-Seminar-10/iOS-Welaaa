//
//  RecommandAudioBookCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/17.
//

import UIKit

import SnapKit
import Then

final class RecommandAudioBookCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecommandAudioBookCollectionViewCell"

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupView() {
        [bookImage, titleLabel, authorLabel].forEach{
            contentView.addSubview($0)
        }
    }

    private func setConstraints() {
        bookImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(105)
            $0.height.equalTo(154)
        }

        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.bookImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }

        authorLabel.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }

    func dataBind(model: RecommandAudioBookModel){
        bookImage.image = UIImage(named: model.bookImage ?? "")
        titleLabel.text = model.title
        authorLabel.text = model.author
    }
}
