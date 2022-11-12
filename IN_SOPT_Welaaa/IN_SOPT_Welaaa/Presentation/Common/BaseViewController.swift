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
    
    func style() {
        view.backgroundColor = Color.gray100
    }
}
