//
//  SearchView.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

import SnapKit
import Then

final class SearchView: BaseView {
    
    
    
    
    private lazy var navigationView = NavigationView()
  
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.collectionViewLayout = layout
        
        $0.register(SearchWordCollectionViewCell.self,
                    forCellWithReuseIdentifier: SearchWordCollectionViewCell.identifier)
        $0.register(KeywordCollectionViewCell.self,
                    forCellWithReuseIdentifier: KeywordCollectionViewCell.identifier)
        $0.register(CategoryCollectionViewCell.self,
                    forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        $0.register(SearchSectionView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SearchSectionView.identifier)
    }

    override func setupView() {
        
        [navigationView, collectionView]
            .forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(70)
            $0.width.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaInsets).inset(20)
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
}
