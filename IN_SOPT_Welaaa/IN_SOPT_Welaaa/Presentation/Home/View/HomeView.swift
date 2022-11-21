//
//  HomeView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    private lazy var scrollView = UIScrollView().then{
        $0.backgroundColor = .black
    }
    
    private lazy var homeNavigationView = HomeNavigationView()
    private lazy var homeAdView = HomeAdView()
    lazy var playlistCollectionView = PlaylistCollectionView()
    lazy var recommandAudioBookCollecionView = RecommandAudioBookCollectionView()
    
    
    override func setupView() {
        addSubview(scrollView)
        
        [homeNavigationView, homeAdView, playlistCollectionView, recommandAudioBookCollecionView].forEach{
            scrollView.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(10000)
        }
        
        homeNavigationView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        homeAdView.snp.makeConstraints {
            $0.top.equalTo(self.homeNavigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(406)
        }
        
        playlistCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.homeAdView.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(105)
        }
        
        recommandAudioBookCollecionView.snp.makeConstraints{
            $0.top.equalTo(self.playlistCollectionView.snp.bottom)
            $0.leading.equalTo(self.playlistCollectionView)
            $0.width.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
    
}
