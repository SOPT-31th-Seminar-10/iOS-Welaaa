//
//  SearchViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    private lazy var searchView = SearchView()
    
    private var authorDummy = Name.authorDummy()
    private var actorDummy = Name.actorDummy()
    
    override func loadView() {
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCollectionView()
    }
}

extension SearchViewController {
    
    private func registerCollectionView() {
        
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
    }
}

extension SearchViewController: UICollectionViewDelegate {}

extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 0:
            return 1
        case 1:
            return authorDummy.count
        case 2:
            return actorDummy.count
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchWordCollectionViewCell.identifier, for: indexPath) as? SearchWordCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.identifier, for: indexPath) as? KeywordCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configureUI(name: authorDummy[indexPath.row])
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.identifier, for: indexPath) as? KeywordCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configureUI(name: actorDummy[indexPath.row])
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SearchSectionView.identifier,
            for: indexPath
        ) as? SearchSectionView else { return UICollectionReusableView() }
        
        headerView.setTitle(text: SearchSection(index: indexPath.section).headerTitle)
        
        return headerView
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 300)
        case 1:
            return CGSize(width: authorDummy[indexPath.item].name.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 16, height: 28)
        case 2:
            return CGSize(width: actorDummy[indexPath.item].name.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 16, height: 28)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 95)
        }
    }
}
