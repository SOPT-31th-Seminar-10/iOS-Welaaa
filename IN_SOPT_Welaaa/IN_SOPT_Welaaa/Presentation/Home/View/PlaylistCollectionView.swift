//
//  playlistCollectionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/17.
//

import UIKit

import SnapKit
import Then

final class PlaylistCollectionView: BaseView {
    lazy var playCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
        addSubview(playCollectionView)
    }
    
    override func setupConstraints() {
        playCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func registerCollectionView() {
        playCollectionView.register(PlaylistCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier )
    }
}

extension PlaylistCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 105)
    }
}


extension PlaylistCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlistDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let playlistcell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as? PlaylistCollectionViewCell else {return UICollectionViewCell()}
        playlistcell.dataBind(model: playlistDummyData[indexPath.item])
        
        return playlistcell
    }
}
