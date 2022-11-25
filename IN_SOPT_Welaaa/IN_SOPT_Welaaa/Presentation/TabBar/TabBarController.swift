//
//  TabBarController.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    private let height = UIScreen.main.bounds.height * 0.1
    
    private lazy var playImage = UIImageView().then {
        $0.image = Image.play
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarAppearance()
        setTabBarItems()
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = height
        tabBar.frame.origin.y = view.frame.height - height
    }
}

// MARK: - Functions

extension TabBarController {
    
    private func setTabBarAppearance() {
        
        UITabBar.clearShadow()
        UITabBar.appearance().backgroundColor = Color.gray100
        UITabBar.appearance().tintColor = Color.green
        UITabBar.appearance().unselectedItemTintColor = Color.gray300
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 10.0)!]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = Color.gray300.cgColor
    }
    
    private func setTabBarItems() {
        
        tabs = [
            HomeViewController(),
            SearchViewController(),
            ShelfViewController(),
            SettingViewController()
        ]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
    
    private func setupView() {
        
        view.addSubview(playImage)
    }
    
    private func setupConstraints() {
        
        playImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(height)
            $0.height.equalTo(60)
        }
    }
}

