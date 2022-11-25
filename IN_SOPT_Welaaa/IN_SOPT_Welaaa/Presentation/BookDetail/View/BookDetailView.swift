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
    
    lazy var scrollView = UIScrollView()
    
    lazy var bookIntroductionView = BookIntroductionView()
    
    lazy var bookDetailTableView = UITableView(frame: .zero, style: .grouped).then{
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        
        $0.isScrollEnabled = false
        $0.showsVerticalScrollIndicator = false
    }
    
    
    var StickyHeaderViewTopConstraint = NSLayoutConstraint()
    var scrollViewTopConstraint = NSLayoutConstraint()
    var TableViewHeightConstraint = NSLayoutConstraint()
    

    
    override func setupView() {
        addSubview(scrollView)
        
        [bookIntroductionView,bookDetailTableView].forEach {
            scrollView.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        bookIntroductionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(668)
        }
        
        bookDetailTableView.snp.makeConstraints {
            $0.top.equalTo(self.bookIntroductionView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(2100)
            $0.bottom.equalToSuperview()
            
        }
    }
}

