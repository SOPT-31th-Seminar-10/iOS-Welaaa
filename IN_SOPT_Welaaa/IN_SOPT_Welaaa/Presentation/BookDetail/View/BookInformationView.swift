//
//  BookInformationView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class BookInformationView: BaseView {
    
    private var infoAudioBookTitleLabel = UILabel().then {
        $0.text = "오디오북 소개"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
        $0.textColor = Color.gray900
    }
    
    private var infoAudioBookLabel = UILabel().then {
        $0.text = """
    산야에 공자는 어디 얼마나 운다. 뭇 웅대한 무엇을 영원히 지
    혜는 것이다. 풀이 온갖 품었기 싹이 봄바람이다. 천하를 밝은
    산야에 거친 없으면, 천고에 없으면 기관과 말이다. 보배를 주
    며, 있을 산야에 현저하게 천지는 것이다. 할지라도 그들의 새
    있는가? 가는 뼈 뜨고, 실현에 대중을 만물은 온갖 봄바람이다.
     능히 인생을 그러므로 얼마나 곳으로 청춘에서만 사람은 부패
    를 앞이 것이다. 이것은 같은 소담스러운 역사를 전인 보라.일
    월과 미묘한 남는 꾸며 갑 곳이 바이며, 끓는다. 길을 목숨을 것
    은 산야에 그림자는 찾아다녀도, 것은 미묘한 희망의 아니다.
     하여도 그들의 위하여, 끝에 끓는다. 이상이 피에 다. 이상이 피
    """
        $0.numberOfLines = 0
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray800
        
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    private var buyPaperBookButton = UIButton().then {
        $0.makeColorRounded(10, 1, Color.gray800)
    }
    
    private var linkIcon = UIImageView().then {
        $0.image = Image.bookDetailLink
    }
    
    private var buyPaperBookLabel = UILabel().then {
        $0.text = "종이책 구매하기"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray900
    }
    
    private var infoAuthorTitleLabel = UILabel().then {
        $0.text = "저자 소개"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
        $0.textColor = Color.gray900
    }
    
    private var authorLabel = UILabel().then {
        $0.text = "이민진"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray600
    }
    
    private var infoAuthorLabel = UILabel().then {
        $0.text = "산야에 공자는 어디 얼마나 운다. 뭇 웅대한 무엇을 영원히 지혜는 것이다. 풀이 온갖 품었기 싹이 봄바람이다. 천하를 밝은 산야에 거친 없으면, 천고에 없으면 기관과 말이다. 보배를 주며, 있을 산야에 현저하게 천지는 것이다. 할지라도 그들의 새 있는가? 가는 뼈 뜨고, 실현에 대중을 만물은 온갖 봄바람이다. 능히 인생을 그러므로 얼마나 곳으로 청춘에서만 사람은 부패를 앞이 것이다. 이것은 같은 소담스러운 역사를 전인 보라.일월과 미묘한 남는 꾸며 갑 곳이 바이며, 끓는다. 길을 목숨을 것은 산야에 그림자는 찾아다녀도, 것은 미묘한 희망의 아니다. 하여도 그들의 위하여, 끝에 끓는다. 이상이 피에 다. 이상이 피"
        $0.numberOfLines = 10;
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    override func setupView() {
        [infoAudioBookTitleLabel, infoAudioBookLabel, buyPaperBookButton, infoAuthorTitleLabel, authorLabel, infoAuthorLabel].forEach {
            addSubview($0)
        }
        
        [linkIcon,buyPaperBookLabel].forEach {
            buyPaperBookButton.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        infoAudioBookTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        infoAudioBookLabel.snp.makeConstraints{
            $0.top.equalTo(self.infoAudioBookTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(206)
        }
        buyPaperBookButton.snp.makeConstraints{
            $0.top.equalTo(self.infoAudioBookLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(36)
        }
        
        linkIcon.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(111)
            $0.width.equalTo(16.04)
            $0.height.equalTo(16)
        }
        
        buyPaperBookLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(self.linkIcon.snp.trailing).offset(10.96)
        }
        
        infoAuthorTitleLabel.snp.makeConstraints{
            $0.top.equalTo(self.buyPaperBookButton.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
        }
        
        authorLabel.snp.makeConstraints{
            $0.top.equalTo(self.infoAuthorTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        infoAuthorLabel.snp.makeConstraints{
            $0.top.equalTo(self.authorLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(206)
        }
    }
    
}


