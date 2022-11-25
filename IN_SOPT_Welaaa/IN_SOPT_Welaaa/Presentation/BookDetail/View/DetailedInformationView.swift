//
//  DetailedInformationView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class DetailedInformationView: UITableViewCell {
    
    static let identifier = "DetailedInformationView"
    
    private var detailedInformationView = UIView()
    
    private var detailedInformationTitleLabel = UILabel().then {
        $0.text = """
        저자
        낭독자
        도서출간일
        오디오북 제작
        오디오북 오픈일
        """
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textAlignment = .left
        $0.textColor = Color.gray800
        $0.numberOfLines = 0
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    private var detailedInformationContentLabel = UILabel().then {
        $0.text = """
        이민진
        이미나,김나율, 김상백
        2022.07.27
        윌라
        2022.08.10
        """
        
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textAlignment = .left
        $0.textColor = Color.gray800
        $0.numberOfLines = 0
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(detailedInformationView)
        
        [detailedInformationTitleLabel, detailedInformationContentLabel].forEach {
            detailedInformationView.addSubview($0)
        }
    }
    private func setupConstraints() {
        
        detailedInformationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(181)
        }
        detailedInformationTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(90)
            $0.height.equalTo(106)
        }
        detailedInformationContentLabel.snp.makeConstraints{
            $0.top.equalTo(self.detailedInformationTitleLabel)
            $0.leading.equalTo(self.detailedInformationTitleLabel.snp.trailing).offset(16)
            $0.width.equalTo(229)
            $0.height.equalTo(106)
        }
    }
}
