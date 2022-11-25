//
//  RellatedKeywordTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class RelatedKeywordTableViewCell: UITableViewCell {
    
    static let identifier = "RelatedKeywordTableViewCell"
    
    private var keywordDummy = Name.keywordDummy()
    
    lazy var relatedKeywordCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(relatedKeywordCollectionView)
    }
    
    private func setConstraints() {
        relatedKeywordCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(146)
        }
    }
    
    private func registerCollectionView() {
        relatedKeywordCollectionView.register(RelatedKeywordCollectionViewCell.self, forCellWithReuseIdentifier: RelatedKeywordCollectionViewCell.identifier)
    }
}

extension RelatedKeywordTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 20, left: 0, bottom: 40, right: 0)
    }
}

extension RelatedKeywordTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatedKeywordCollectionViewCell.identifier, for: indexPath) as? RelatedKeywordCollectionViewCell else {return UICollectionViewCell()}
        cell.configureUI(name: keywordDummy[indexPath.row])
        return cell
    }
}



