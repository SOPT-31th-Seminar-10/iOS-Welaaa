//
//  RecommandAudioBookCollectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/17.
//

import UIKit

import SnapKit
import Then

final class RecommandAudioBookCollectionView: BaseView {
    lazy var recommandAudioBookCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
    
    override func setupView() {
        addSubview(recommandAudioBookCollectionView)
    }
    
    override func setupConstraints() {
        recommandAudioBookCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func registerCollectionView() {
        recommandAudioBookCollectionView.register(RecommandAudioBookCollectionViewCell.self, forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier )
    }
}

extension RecommandAudioBookCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}


extension RecommandAudioBookCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommandAudioBookDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let recommandAudioBookcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {return UICollectionViewCell()}
        recommandAudioBookcell.dataBind(model: recommandAudioBookDummyData[indexPath.item])
        
        return recommandAudioBookcell
    }
}
