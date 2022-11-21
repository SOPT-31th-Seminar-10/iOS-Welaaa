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
    
    lazy var homeTablewView = UITableView(frame: .zero, style: .grouped).then{
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func setupView() {
        addSubview(homeTablewView)
    }
    
    override func setupConstraints() {
        homeTablewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
