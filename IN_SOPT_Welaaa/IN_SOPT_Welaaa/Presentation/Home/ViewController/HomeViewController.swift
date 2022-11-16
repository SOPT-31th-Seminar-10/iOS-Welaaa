//
//  HomeViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private lazy var homeView = HomeView()
    
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        
    }
}

extension HomeViewController {

    private func registerCollectionView() {
        homeView.playlistCollectionView.registerCollectionView()
        homeView.recommandAudioBookCollecionView.registerCollectionView()
    }
}










































//
//extension HomeViewController: UICollectionViewDelegate {}
//
//
//extension HomeViewController: UICollectionViewDataSource {
//
//
//
//
//    // 지정된 섹션에 표시할 항목의 개수를 묻는 메소드
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//    }
//
//    // 컬렉션 뷰에 지정된 위치에 표시할 셀을 요청하는 메소드
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
////        case 0:
////
////
////        case 1:
////            guard let recommandcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {return UICollectionViewCell()}
////            recommandcell.dataBind(model: recommandDummyData[indexPath.item])
////            return recommandcell
////
////        default:
////            guard let recommandcell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {return UICollectionViewCell()}
////            recommandcell.dataBind(model: recommandDummyData[indexPath.item])
////            return recommandcell
//        }
//    }
//
////    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////
////        guard let headerView = collectionView.dequeueReusableSupplementaryView(
////            ofKind: kind,
////            withReuseIdentifier: HomeSectionView.identifier,
////            for: indexPath
////        ) as? HomeSectionView else { return UICollectionReusableView() }
////
////        headerView.setTitle(text: HomeSection(index: indexPath.section).headerTitle)
////
////        return headerView
////    }
////}
//
//
//extension HomeViewController: UICollectionViewDelegateFlowLayout {
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
////        return CGSize(width: UIScreen.main.bounds.width, height: 40)
////    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.section {
//        case 0:
//            return CGSize(width: 220, height: 105)
//        case 1:
//            return CGSize(width: 105, height: 200)
////        case 2:
//        default:
//            return CGSize(width: 0, height: 0)
//        }
//
//    }
//}
