//
//  BookDetailViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

final class BookDetailViewController: BaseViewController {
    
    private lazy var bookDetailView = BookDetailView()
    
    
    override func loadView() {
        self.view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
    }
}

extension BookDetailViewController {
    private func registerTableView() {
        bookDetailView.bookDetailTableView.register(BookDetailTableViewCell.self, forCellReuseIdentifier: BookDetailTableViewCell.identifier)
    }
}

extension BookDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10000
    }
}

extension BookDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookDetailTableViewCell.identifier, for: indexPath) as? BookDetailTableViewCell else { return UITableViewCell()}
        return cell
    }
}

