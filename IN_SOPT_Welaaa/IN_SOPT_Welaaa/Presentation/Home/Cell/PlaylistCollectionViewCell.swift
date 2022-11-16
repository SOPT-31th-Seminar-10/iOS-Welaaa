//
//  PlaylistCollectionViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class PlaylistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlaylistCollectionViewCell"
    
    private lazy var bookImage = UIImageView().then {
        $0.backgroundColor = .white
        $0.makeRounded(radius: 37)
        $0.makeColorRounded(37, 3, Color.green)
    }
    
    private lazy var playlistView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var titleLabel = UILabel().then{
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    private lazy var authorLabel = UILabel().then{
        $0.textColor = Color.gray600
        $0.textAlignment = .left
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    private lazy var progressLabel = UILabel().then{
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
        [playlistView, bookImage].forEach{
            contentView.addSubview($0)
        }
        
        [titleLabel,authorLabel, progressLabel].forEach{
            playlistView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        
        bookImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(80)
        }
        
        playlistView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(41)
            $0.leading.equalToSuperview().offset(22)
            $0.width.equalTo(198)
            $0.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalTo(self.bookImage.snp.trailing).offset(22)
        }
        
        authorLabel.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom)
            $0.leading.equalTo(self.titleLabel)
        }
        
        progressLabel.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom)
            $0.leading.equalTo(self.authorLabel.snp.trailing).offset(22)
        }
        
    }
    
    func dataBind(model: PlaylistModel){
        bookImage.image = UIImage(named: model.bookImage ?? "")
        titleLabel.text = model.title
        authorLabel.text = model.author
        
        progressLabel.text = model.progress
        
    }
}
