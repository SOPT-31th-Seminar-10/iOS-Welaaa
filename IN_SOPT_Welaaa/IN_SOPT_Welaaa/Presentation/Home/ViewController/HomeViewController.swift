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
        registerTableView()
    }
}

extension HomeViewController {
    private func registerTableView() {
        
        homeView.homeTableView.register(HomeNavigationViewCell.self, forCellReuseIdentifier: HomeNavigationViewCell.identifier)
        
        homeView.homeTableView.register(HomeAdViewCell.self, forCellReuseIdentifier: HomeAdViewCell.identifier)

        homeView.homeTableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: PlaylistTableViewCell.identifier)

        homeView.homeTableView.register(RecommandAudioBookTableViewCell.self, forCellReuseIdentifier: RecommandAudioBookTableViewCell.identifier)

        homeView.homeTableView.register(MonthAudioBookTableViewCell.self, forCellReuseIdentifier: MonthAudioBookTableViewCell.identifier)

        homeView.homeTableView.register(RecentlyAudioBookTableViewCell.self, forCellReuseIdentifier: RecentlyAudioBookTableViewCell.identifier)

        homeView.homeTableView.register(HomeFooterAdViewCell.self, forCellReuseIdentifier: HomeFooterAdViewCell.identifier)
        
        homeView.homeTableView.register(HomeSectionView.self, forHeaderFooterViewReuseIdentifier: HomeSectionView.identifier)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 66
        case 1:
            return 407
        case 2:
            return 105
        case 3:
            return 244
        case 4:
            return 389
        case 5:
            return 244
        case 6:
            return 204
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 355, height: 28)
    }
}


extension HomeView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let navigationCell =  tableView.dequeueReusableCell(withIdentifier: HomeNavigationViewCell.identifier, for: indexPath) as? HomeNavigationViewCell else { return UITableViewCell()}
            navigationCell.selectionStyle = .none
            return navigationCell
            
        case 1:
            guard let adCell = tableView.dequeueReusableCell(withIdentifier: HomeAdViewCell.identifier, for: indexPath) as? HomeAdViewCell else { return UITableViewCell() }
            adCell.selectionStyle = .none
            return adCell

        case 2:
            guard let playlistCell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewCell.identifier, for: indexPath) as? PlaylistTableViewCell else { return UITableViewCell()}
            playlistCell.selectionStyle = .none
            return playlistCell
//
        case 3:
            guard let recommandAudioBookCell = tableView.dequeueReusableCell(withIdentifier: RecommandAudioBookTableViewCell.identifier, for: indexPath) as? RecommandAudioBookTableViewCell else { return UITableViewCell()}
            recommandAudioBookCell.selectionStyle = .none
            return recommandAudioBookCell
//
        case 4:
            guard let monthAudioBookCell = tableView.dequeueReusableCell(withIdentifier: MonthAudioBookTableViewCell.identifier, for: indexPath) as? MonthAudioBookTableViewCell else { return UITableViewCell()}
            monthAudioBookCell.selectionStyle = .none
            return monthAudioBookCell
//
        case 5:
            guard let recentlyAudioBookCell = tableView.dequeueReusableCell(withIdentifier: RecommandAudioBookTableViewCell.identifier, for: indexPath) as? RecommandAudioBookTableViewCell else { return UITableViewCell()}
            recentlyAudioBookCell.selectionStyle = .none
            return recentlyAudioBookCell
            
        case 6:
            guard let footerAdCell = tableView.dequeueReusableCell(withIdentifier: HomeFooterAdViewCell.identifier, for: indexPath) as? HomeFooterAdViewCell else { return UITableViewCell() }
            return footerAdCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HomeSectionView.identifier,
            for: indexPath
        ) as? HomeSectionView else { return UICollectionReusableView() }
        
        headerView.setTitle(text: HomeSection(index: indexPath.section).headerTitle)
        
        return headerView
    }
}

