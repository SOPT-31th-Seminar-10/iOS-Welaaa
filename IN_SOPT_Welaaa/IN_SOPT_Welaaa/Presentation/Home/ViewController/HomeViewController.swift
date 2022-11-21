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
        homeView.homeTablewView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10000
    }
}

extension HomeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
        return cell
    }
}
