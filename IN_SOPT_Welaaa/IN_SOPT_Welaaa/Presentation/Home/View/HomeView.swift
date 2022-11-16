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
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        
    }
    
    private lazy var homeNavigationView = HomeNavigationView()
    private lazy var homeAdView = HomeAdView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        
        $0.register(PlaylistCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier )
        
    }
    
    override func setupView() {
        addSubview(scrollView)
        
        [homeNavigationView, homeAdView, collectionView].forEach{
            scrollView.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(safeAreaLayoutGuide)
            
        }
        
        homeNavigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        homeAdView.snp.makeConstraints {
            $0.top.equalTo(self.homeNavigationView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(406)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.homeAdView.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(playlistDummyData.count * 220)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
        }
    }
    
}
