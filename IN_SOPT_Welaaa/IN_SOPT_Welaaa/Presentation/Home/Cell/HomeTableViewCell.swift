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
    
    lazy var playCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
//        $0.delegate = self
//        $0.dataSource = self
        
        $0.register(PlaylistCollectionViewCell.self,
                    forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
    }
    
    lazy var recommandAudioBookCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
//        $0.delegate = self
//        $0.dataSource = self
        
        $0.register(RecommandAudioBookCollectionViewCell.self,
                    forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        [homeNavigationCell, homeAdCell, playCollectionView, recommandAudioBookCollectionView]
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
        
        playCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(105)
        }
        
        recommandAudioBookCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.playCollectionView.snp.bottom)
            $0.leading.equalTo(self.playCollectionView)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
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
//            return recommandAudioBookDummyData.count
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
//            guard let recommandAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
//                return UICollectionViewCell()}
//            recommandAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
//            return recommandAudioBookCell
//        default:
//            return UICollectionViewCell()
//
//        }
//    }
//}
