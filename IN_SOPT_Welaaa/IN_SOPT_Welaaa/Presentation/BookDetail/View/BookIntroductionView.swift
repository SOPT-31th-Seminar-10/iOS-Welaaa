//
//  BookIntroductionView.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class BookIntroductionView: BaseView {
    
    static let identifier = "bookIntroductionView"
    
    var backButton = UIButton().then {
        $0.setImage(Image.back, for: .normal)
    }
    
    private var shareButton = UIButton().then {
        $0.setImage(Image.shareRound, for: .normal)
    }
    
    private var bookImage = UIImageView().then {
        $0.image = UIImage(named: "달러구트") // 서버에서 가져올거임
        $0.layer.applySketchShadow(color: .black, alpha: 0.16, x: 2, y: 6, blur: 23, spread: 0)
    }
    
    private var keywordView = UIView()
    
    private var keywordButton = UIButton().then {
        $0.setTitle("오디오북", for: .normal)
        $0.setTitleColor(Color.gray600, for: .normal)
        $0.titleLabel!.font = UIFont.font(.pretendardRegular, ofSize: 12)
        $0.makeRounded(radius: 4)
        $0.backgroundColor = Color.gray300
    }
    
    private var keywordLabel = UILabel().then {
        $0.text = "윌라 독점 · 이달의 오디오북 · 완독"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
        $0.textColor = Color.gray800
        $0.textAlignment = .center
    }
    
    
    private var infoIcon = UIImageView().then {
        $0.image = Image.info
    }
    
    private var bookTitleLabel = UILabel().then {
        $0.text = "파친코" //서버에서 가져올거임
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 20)
        $0.textColor = Color.gray900
    }
    
    private var bookIntroductionLabel = UILabel().then {
        $0.text = "전세계를 감동시킨 재일 조선인 가족의 대서사극" //서버?
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var playIcon = UIImageView().then {
        $0.image = Image.bookDetailPlay
    }
    
    private var playCnt = UILabel().then {
        $0.text = "110만  ·"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textColor = Color.gray900
    }
    
    private var starIcon = UIImageView().then {
        $0.image = Image.bookDetailStar
    }
    
    private var starCnt = UILabel().then {
        $0.text = "4.9  ·"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textColor = Color.gray900
    }
    
    private var downloadIcon = UIImageView().then {
        $0.image = Image.bookDetailDown
    }
    
    private var downloadLabel = UILabel().then {
        $0.text = "1.4GB"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textColor = Color.gray900
    }
    
    private var novelLabel = UILabel().then {
        $0.text = "·  소설 >"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 12)
        $0.textColor = Color.green
    }
    
    private var playButton = UIButton().then {
        $0.backgroundColor = Color.gray200
        $0.makeRounded(radius: 8)
    }
    
    private var audioBookPlayIcon = UIImageView().then {
        $0.image = Image.bookDetailPlay
    }
    
    private var playLabel = UILabel().then {
        $0.text = "재생하기"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var wantedButton = UIButton().then {
        $0.backgroundColor = Color.gray200
        $0.makeRounded(radius: 8)
    }
    
    private var plusIcon = UIImageView().then {
        $0.image = Image.bookDetailPlus
    }
    
    private var wantedLabel = UILabel().then {
        $0.text = "찜 7,371"
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    
    
    private var playTimeLabel = UILabel().then {
        $0.text = "총 재생 시간 10시간 44분"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var subBookIntroductionLabel = UILabel().then {
        $0.text = "전세계를 감동시킨 재일 조선인 가족의 대서사극" //서버?
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
        $0.textColor = Color.gray400
    }
    
    private var membershipButton = UIButton().then {
        $0.setTitle("멤버십 가입하고 무제한 감상하기", for: .normal)
        $0.setTitleColor(Color.white, for: .normal)
        $0.titleLabel!.font = UIFont.font(.pretendardMedium, ofSize: 16)
        $0.backgroundColor = Color.green
        $0.makeRounded(radius: 8)
    }
    
    private var priceButton = UIButton().then {
        $0.setTitle("개별 구매하기 15,000원", for: .normal)
        $0.setTitleColor(Color.gray800, for: .normal)
        $0.titleLabel!.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.backgroundColor = Color.gray200
        $0.makeRounded(radius: 8)
    }
    
    private var separateView = UIView().then {
        $0.backgroundColor = Color.gray200
    }
    
    private var pagerTab = UIView()
    
    private var infoBookLabel = UILabel().then {
        $0.text = "책 정보"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.green
    }
    
    private var infoBookSeparateLine = UIView().then {
        $0.backgroundColor = Color.green
    }
    
    private var indexPartLabel = UILabel().then {
        $0.text = "목차 13"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var reviewPartLabel =  UILabel().then {
        $0.text = "리뷰 444"
        $0.textAlignment = .center
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 14)
        $0.textColor = Color.gray800
    }
    
    private var separatorBar = UIView().then {
        $0.backgroundColor = Color.gray200
    }
    
    
    
    override func setupView() {
        
        [backButton, shareButton, bookImage, keywordButton, keywordLabel, infoIcon, bookTitleLabel, bookIntroductionLabel, playIcon, playCnt, starIcon, starCnt, downloadIcon, downloadLabel, novelLabel,  playButton,  wantedButton, playTimeLabel, subBookIntroductionLabel,membershipButton,priceButton,separateView, pagerTab, separatorBar].forEach {
            addSubview($0)
        }
        
        [audioBookPlayIcon, playLabel].forEach {
            playButton.addSubview($0)
        }
        
        [plusIcon, wantedLabel].forEach {
            wantedButton.addSubview($0)
        }
        
        [infoBookLabel, indexPartLabel, reviewPartLabel, infoBookSeparateLine].forEach {
            pagerTab.addSubview($0)
        }
        
    }
    
    override func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
            $0.size.equalTo(30)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(self.backButton)
            $0.trailing.equalToSuperview().offset(-23)
            $0.width.equalTo(23)
            $0.height.equalTo(20)
        }
        
        bookImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(128)
            $0.width.equalTo(120)
            $0.height.equalTo(172)
        }
        
        keywordButton.snp.makeConstraints {
            $0.top.equalTo(self.bookImage.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(20)
        }
        
        keywordLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookImage.snp.bottom).offset(28)
            $0.leading.equalTo(self.keywordButton.snp.trailing).offset(8)
        }
        
        infoIcon.snp.makeConstraints {
            $0.top.equalTo(self.bookImage.snp.bottom).offset(25.67)
            $0.leading.equalTo(self.keywordLabel.snp.trailing).offset(98.67)
            $0.size.equalTo(16.67)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.keywordButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
        }
        
        bookIntroductionLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookTitleLabel.snp.bottom).offset(14)
            $0.leading.equalTo(bookTitleLabel)
        }
        
        playIcon.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(15.5)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(8)
            $0.height.equalTo(9)
        }
        
        playCnt.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(self.playIcon.snp.trailing).offset(7)
            
        }
        
        starIcon.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(13.07)
            $0.leading.equalTo(self.playCnt.snp.trailing).offset(5.38)
            $0.width.equalTo(13.23)
            $0.height.equalTo(12.64)
        }
        
        starCnt.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(self.starIcon.snp.trailing).offset(5.38)
        }
        
        downloadIcon.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(13)
            $0.leading.equalTo(self.starCnt.snp.trailing).offset(7)
            $0.width.equalTo(10)
            $0.height.equalTo(13.33)
        }
        
        downloadLabel.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(self.downloadIcon.snp.trailing).offset(7)
        }
        
        novelLabel.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(self.downloadLabel.snp.trailing).offset(8)
        }
        
        playButton.snp.makeConstraints {
            $0.top.equalTo(self.starCnt.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(220)
            $0.height.equalTo(34)
        }
        
        audioBookPlayIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12.5)
            $0.leading.equalToSuperview().offset(76)
            $0.width.equalTo(8)
            $0.height.equalTo(9)
        }
        
        playLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.audioBookPlayIcon.snp.trailing).offset(12)
        }
        
        wantedButton.snp.makeConstraints {
            $0.top.equalTo(self.playButton)
            $0.leading.equalTo(self.playButton.snp.trailing).offset(15)
            $0.width.equalTo(100)
            $0.height.equalTo(34)
        }
        
        plusIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(8)
        }
        
        wantedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.plusIcon.snp.trailing).offset(8)
        }
        
        playTimeLabel.snp.makeConstraints {
            $0.top.equalTo(self.playButton.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
        subBookIntroductionLabel.snp.makeConstraints {
            $0.top.equalTo(self.playTimeLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        membershipButton.snp.makeConstraints {
            $0.top.equalTo(self.subBookIntroductionLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(48)
        }
        
        priceButton.snp.makeConstraints {
            $0.top.equalTo(self.membershipButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(36)
        }
        
        separateView.snp.makeConstraints {
            $0.top.equalTo(self.priceButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(12)
        }
        
        pagerTab.snp.makeConstraints{
            $0.top.equalTo(self.separateView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(42)
        }
        
        infoBookLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(69)
            $0.height.equalTo(40)
        }
        
        infoBookSeparateLine.snp.makeConstraints {
            $0.top.equalTo(self.pagerTab.snp.bottom).offset(1)
            $0.leading.equalTo(self.infoBookLabel)
            $0.width.equalTo(69)
            $0.height.equalTo(2)
        }
        
        indexPartLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.infoBookLabel.snp.trailing).offset(14)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
        
        reviewPartLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(self.indexPartLabel.snp.trailing).offset(14)
            $0.width.equalTo(65)
            $0.height.equalTo(40)
        }
        
        separatorBar.snp.makeConstraints {
            $0.top.equalTo(self.pagerTab.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(1)
        }
    }
}


