//
//  SeriesColletionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/21.
//

import UIKit

import SnapKit
import Then

import UIKit

import SnapKit
import Then

class BookImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookImageCollectionViewCell"
    
    private lazy var bookImage = UIImageView().then {
        $0.makeRounded(radius: 10)
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
        contentView.addSubview(bookImage)
    }
    
    
    private func setConstraints() {
        bookImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(258)
        }
    }
    
    func dataBind(model: RecommandAudioBookModel){
        bookImage.image = UIImage(named: model.bookImage)
    }
}


