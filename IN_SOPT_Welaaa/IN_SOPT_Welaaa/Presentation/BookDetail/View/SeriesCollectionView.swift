//
//  SeriesCollectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/21.
//

import UIKit

import SnapKit
import Then

final class SeriesCollectionView: BaseView {
    lazy var collectionView =
    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
        
        $0.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
    }
    
    override func setupView() {
        addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
}
