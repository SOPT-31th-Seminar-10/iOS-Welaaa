//
//  BookDetailView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class BookDetailView: BaseView {
    lazy var bookDetailTableView = UITableView(frame: .zero, style: .grouped).then{
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func setupView() {
        addSubview(bookDetailTableView)
    }
    
    override func setupConstraints() {
        bookDetailTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

