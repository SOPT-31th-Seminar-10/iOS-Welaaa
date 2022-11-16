//
//  HomeViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private lazy var homeView = HomeView()
    
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registerCollectionView()
        
    }
}

//extension HomeViewController {
//
//    private func registerCollectionView() {
//
//        homeView.collectionView.delegate = self
//        homeView.collectionView.dataSource = self
//    }
//}
//
//extension HomeViewController: UICollectionViewDelegate {}
//
//extension HomeViewController: UICollectionViewDataSource {
