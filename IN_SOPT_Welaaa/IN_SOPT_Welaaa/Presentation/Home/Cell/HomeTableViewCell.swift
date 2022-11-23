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
    
    lazy var monthAudioBookCollectionView = MonthAudioBookCollectionView()
    
    lazy var recentlyAudioBookCollectionView = RecentlyAudioBookColletionView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        [homeNavigationCell, homeAdCell, playlistCollectionView, recommandAudioBookCollectionView, monthAudioBookCollectionView, recentlyAudioBookCollectionView]
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
            $0.width.equalTo(1000)
            $0.height.equalTo(149)
        }
        
        recommandAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.playlistCollectionView.snp.bottom).offset(52)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(355)
            $0.height.equalTo(241)
        }
        
        monthAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.recommandAudioBookCollectionView.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375) //682
             $0.height.equalTo(389)
        }
        
        recentlyAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.monthAudioBookCollectionView.snp.bottom).offset(56)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalTo(355) //450
             $0.height.equalTo(244)
            
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

extension MonthAudioBookCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 345)
    }
}

extension MonthAudioBookCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monthAudioBookDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let monthAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthAudioBookCollectionViewCell.identifier, for: indexPath) as? MonthAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        monthAudioBookCell.dataBind(model: monthAudioBookDummyData[indexPath.row])
        return monthAudioBookCell
    }
}

extension RecentlyAudioBookColletionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}

extension RecentlyAudioBookColletionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommandAudioBookDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let recentlyAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        recentlyAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
        return recentlyAudioBookCell
    }
}
