//
//  HomeTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/18.
//

import UIKit

import SnapKit
import Then

final class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    private lazy var homeNavigationCell = HomeNavigationView()
    
    private lazy var homeAdCell = HomeAdView()
    
    lazy var playlistCollectionView = PlaylistCollectionView()
    
    lazy var recommandAudioBookCollectionView = RecommandAudioBookCollectionView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        
        playlistCollectionView.collectionView.register(PlaylistCollectionViewCell.self,
                                                                         forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        [homeNavigationCell, homeAdCell, playlistCollectionView, recommandAudioBookCollectionView]
            .forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        
        homeNavigationCell.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        homeAdCell.snp.makeConstraints {
            $0.top.equalTo(self.homeNavigationCell.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(406)
        }
        
        playlistCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.homeAdCell.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(149)
        }
        
        recommandAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.playlistCollectionView.snp.bottom).offset(52)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(355)
            $0.bottom.equalTo(244)
        }
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
        guard let playlistCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as? PlaylistCollectionViewCell else {
            return UICollectionViewCell()}
        playlistCell.dataBind(model: playlistDummyData[indexPath.row])
        return playlistCell
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
        guard let recommandAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        recommandAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
        return recommandAudioBookCell
    }
}


//extension HomeTableViewCell: UICollectionViewDelegate {}
//extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.section {
//        case 0:
//            return CGSize(width: 220, height: 105)
//        case 1:
//            return CGSize(width: 105, height: 200)
//        default:
//            return CGSize(width: 0, height: 0)
//
//        }
//    }
//}
//
//extension HomeTableViewCell: UICollectionViewDataSource {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return playlistDummyData.count
//        case 1:
//
//        default:
//            return 0
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.section {
//        case 0:
//            guard let playlistCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as? PlaylistCollectionViewCell else {
//                return UICollectionViewCell()}
//            playlistCell.dataBind(model: playlistDummyData[indexPath.row])
//            return playlistCell
//        case 1:
//
//        default:
//            return UICollectionViewCell()
//
//        }
//    }
//}

