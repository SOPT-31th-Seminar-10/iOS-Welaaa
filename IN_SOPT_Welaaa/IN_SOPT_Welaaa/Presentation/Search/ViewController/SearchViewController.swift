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
    
    private var categoryData = [CategoryData(id: 0, category: "", description: "", image: "")] {
        didSet {
            searchView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        getCategory()
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
            return categoryData.count
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
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                cell.update(category: self.categoryData, indexPath: indexPath)
            }
          
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

extension SearchViewController {
    
    func getCategory() {
        
        CategoryAPI.shared.getCategory(completion: { (response) in
            
            switch response {
            case .success(let data):
                
                if let data = data as? [CategoryData] {
                    self.categoryData = data
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        })
    }
}
