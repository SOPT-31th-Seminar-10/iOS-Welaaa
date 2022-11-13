//
//  BaseView.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
    func setupConstraints() {}
}

