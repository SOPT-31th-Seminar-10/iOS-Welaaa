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
    
    lazy var homeTableView = UITableView(frame: .zero, style: .grouped).then{
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        
        $0.delegate = self
        $0.dataSource = self
    }
    
    override func setupView() {
        addSubview(homeTableView)
    }
    
    override func setupConstraints() {
        homeTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
}
