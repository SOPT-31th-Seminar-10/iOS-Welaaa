//
//  BaseViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setNavigationBar()
    }
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
