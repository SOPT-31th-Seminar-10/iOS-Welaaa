//
//  CategoryCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/13.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var layerView = UIView().then {
        $0.makeColorRounded(8, 1, Color.green)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.gray900
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
    }
    
    private lazy var subtitleLabel = UILabel().then {
        $0.textColor = Color.gray400
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var bookImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private func setupView() {
        
        [titleLabel, subtitleLabel, layerView, bookImage]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        layerView.snp.makeConstraints {
            $0.height.equalTo(82)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(layerView.snp.top).inset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(20)
        }
        
        bookImage.snp.makeConstraints {
            $0.height.equalTo(93)
            $0.width.equalTo(66)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(1)
        }
    }
    
    func update(category: [CategoryData], indexPath: IndexPath) {
     
        self.titleLabel.text = category[indexPath.row].category
        self.subtitleLabel.text = category[indexPath.row].datumDescription
        
        guard let url = URL(string: category[indexPath.row].image) else { return }
        let resource = ImageResource(downloadURL: url)

        self.bookImage.kf.setImage(with: resource)
    }
}
