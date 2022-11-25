//
//  HomeViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/16.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private lazy var homeView = HomeView()
    
    var bookListData = [BookData(id: 0, title: "", description: "", image: "", author: "")] {
        didSet {
            homeView.homeTableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        
        getBookList()
    }
}

extension HomeViewController {
    private func registerTableView() {
        
        homeView.homeTableView.delegate = self
        homeView.homeTableView.dataSource = self
        
        homeView.homeTableView.register(HomeNavigationViewCell.self, forCellReuseIdentifier: HomeNavigationViewCell.identifier)
        
        homeView.homeTableView.register(HomeAdViewCell.self, forCellReuseIdentifier: HomeAdViewCell.identifier)
        
        homeView.homeTableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: PlaylistTableViewCell.identifier)
        
        homeView.homeTableView.register(RecommandAudioBookTableViewCell.self, forCellReuseIdentifier: RecommandAudioBookTableViewCell.identifier)
        
        homeView.homeTableView.register(MonthAudioBookTableViewCell.self, forCellReuseIdentifier: MonthAudioBookTableViewCell.identifier)
        
        homeView.homeTableView.register(RecentlyAudioBookTableViewCell.self, forCellReuseIdentifier: RecentlyAudioBookTableViewCell.identifier)
        
        homeView.homeTableView.register(HomeFooterAdViewCell.self, forCellReuseIdentifier: HomeFooterAdViewCell.identifier)
        
        //        homeView.homeTableView.register(HomeSectionView.self, forHeaderFooterViewReuseIdentifier: HomeSectionView.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 66
        case 1:
            return 367
        case 2:
            return 149
        case 3:
            return 200
        case 4:
            return 345
        case 5:
            return 200
        case 6:
            return 300
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 41
    }
}


extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: HomeNavigationViewCell.identifier, for: indexPath) as? HomeNavigationViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeAdViewCell.identifier, for: indexPath) as? HomeAdViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewCell.identifier, for: indexPath) as? PlaylistTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            cell.dataBind(bookList: self.bookListData)
            cell.registerCollectionView()
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommandAudioBookTableViewCell.identifier, for: indexPath) as? RecommandAudioBookTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            cell.registerCollectionView()
            cell.dataBind(bookList: self.bookListData)
            cell.delegate = self
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonthAudioBookTableViewCell.identifier, for: indexPath) as? MonthAudioBookTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            cell.registerCollectionView()
            cell.dataBind(bookList: self.bookListData)
            cell.delegate = self
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommandAudioBookTableViewCell.identifier, for: indexPath) as? RecommandAudioBookTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            cell.registerCollectionView()
            cell.dataBind(bookList: self.bookListData)
            cell.delegate = self
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFooterAdViewCell.identifier, for: indexPath) as? HomeFooterAdViewCell else { return UITableViewCell() }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 2:
            let headerView = HomeSectionView()
            headerView.setTitle(text: "듣고 있던 오디오북! 계속 들어볼까요?")
            return headerView
        case 3:
            let headerView = HomeSectionView()
            headerView.setTitle(text: "반유진님이 좋아할 만한 오디오북")
            return headerView
            
        case 4:
            let headerView = HomeSectionView()
            headerView.setTitle(text: "이 달의 오디오북")
            return headerView
        case 5:
            let headerView = HomeSectionView()
            headerView.setTitle(text: "지금 막 녹음을 끝낸 오디오북")
            return headerView
        default:
            return UIView()
            
        }
    }
}

extension HomeViewController: RecommandAudioVBookCollectionViewCellDelegate {
    func selectedRecommandAudioVBookCollectionViewCell(_ tableView: UITableView, _ index: Int) {
        let vc = BookDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: MonthAudioBookCollectionViewCellDelegate {
    func selectedMonthAudioBookCollectionViewCell(_ tableView: UITableView, _ index: Int) {
        let vc = BookDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: RecentlyAudioBookCollectionViewCellDelegate {
    func selectedRecentlyAudioBookCollectionViewCell(_ tableView: UITableView, _ index: Int) {
        let vc = BookDetailViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController {
    
    func getBookList() {
        BookAPI.shared.getBookList(completion: { (response) in
            
            switch response {
            case .success(let data):
                if let data = data as? [BookData] {
                    self.bookListData = data
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
