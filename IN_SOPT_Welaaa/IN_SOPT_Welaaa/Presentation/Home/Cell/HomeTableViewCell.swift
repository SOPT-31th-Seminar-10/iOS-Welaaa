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
    
    lazy var playlistCollectionView =
    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
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
    
    lazy var monthAudioBookCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
    
    lazy var recentlyAudioBookCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
    
    lazy var homeFooterAdCell = HomeFooterAdView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCollectionView() {
        playlistCollectionView.register(PlaylistCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
        
        recommandAudioBookCollectionView.register(RecommandAudioBookCollectionViewCell.self,
                                                  forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier)
        
        monthAudioBookCollectionView.register(MonthAudioBookCollectionViewCell.self,
                                              forCellWithReuseIdentifier: MonthAudioBookCollectionViewCell.identifier)
        
        recentlyAudioBookCollectionView.register(RecommandAudioBookCollectionViewCell.self,
                                                 forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier)
    }
    
    private func setupView() {
        [homeNavigationCell, homeAdCell, playlistCollectionView, recommandAudioBookCollectionView, monthAudioBookCollectionView, recentlyAudioBookCollectionView, homeFooterAdCell]
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
            $0.height.equalTo(407)
        }
        
        playlistCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.homeAdCell.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(1000)
            $0.height.equalTo(149)
        }
        
        recommandAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.playlistCollectionView.snp.bottom).offset(56)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(450)
            $0.height.equalTo(241)
        }
        
        monthAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.recommandAudioBookCollectionView.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(682) //682
            $0.height.equalTo(389)
        }
        
        recentlyAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.monthAudioBookCollectionView.snp.bottom).offset(56)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(355) //450
            $0.height.equalTo(244)
        }
        
        homeFooterAdCell.snp.makeConstraints {
            $0.top.equalTo(self.recentlyAudioBookCollectionView.snp.bottom).offset(56)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(450)
            $0.height.equalTo(204)
        }
    }
}


extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case playlistCollectionView:
            return CGSize(width: 220, height: 105)
        case recommandAudioBookCollectionView:
            return CGSize(width: 105, height: 200)
        case monthAudioBookCollectionView:
            return CGSize(width: 163, height: 345)
        case recentlyAudioBookCollectionView:
            return CGSize(width: 105, height: 200)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension HomeTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case playlistCollectionView:
                guard let playlistCell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as? PlaylistCollectionViewCell else {
                    return UICollectionViewCell()}
                playlistCell.dataBind(model: playlistDummyData[indexPath.row])
                return playlistCell
                
            case recommandAudioBookCollectionView:
                guard let recommandAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
                    return UICollectionViewCell()}
                recommandAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
                return recommandAudioBookCell
            
            case monthAudioBookCollectionView:
                guard let monthAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthAudioBookCollectionViewCell.identifier, for: indexPath) as? MonthAudioBookCollectionViewCell else {
                    return UICollectionViewCell()}
                monthAudioBookCell.dataBind(model: monthAudioBookDummyData[indexPath.row])
                return monthAudioBookCell
            
            case recentlyAudioBookCollectionView:
                guard let recentlyAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
                    return UICollectionViewCell()}
                recentlyAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
                return recentlyAudioBookCell
            
            default:
                return UICollectionViewCell()
        }
    }
}
