//
//  BookDetailTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class BookDetailTableViewCell: UITableViewCell {
    
    static let identifier = "BookDetailTableViewCell"
    
    private var keywordDummy = Name.keywordDummy()
    
    private lazy var bookIntroductionCell = BookIntroductionView()
    
    private lazy var seriesCollectionViewHeaderLabel = UILabel().then {
        $0.text = "[시리즈] 파친코"
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.backgroundColor = Color.white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 20)
    }
    
    lazy var seriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
    
    lazy var bookImageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
    private lazy var bookInformationCell = BookInformationView()
    
    private lazy var relatedKeywordCollectionView =     UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
    
    private lazy var detailedInformationCell = DetailedInformationView()
    
    private lazy var recommandContentCollectionViewHeaderLabel = UILabel().then {
        $0.text = "김나은님이 좋아할 컨텐츠"
        $0.textColor = Color.gray900
        $0.textAlignment = .left
        $0.backgroundColor = Color.white
        $0.font = UIFont.font(.pretendardMedium, ofSize: 20)
    }
    
    private lazy var recommandContentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.delegate = self
        $0.dataSource = self
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        registerCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCollectionView() {
        seriesCollectionView.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
        
        bookImageCollectionView.register(BookImageCollectionViewCell.self, forCellWithReuseIdentifier: BookImageCollectionViewCell.identifier)
        
        relatedKeywordCollectionView.register(RelatedKeywordCollectionViewCell.self, forCellWithReuseIdentifier: RelatedKeywordCollectionViewCell.identifier)
        
        recommandContentCollectionView.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
    }
    
    private func setupView() {
        [bookIntroductionCell, seriesCollectionViewHeaderLabel, seriesCollectionView, bookImageCollectionView,bookInformationCell,relatedKeywordCollectionView,detailedInformationCell ,recommandContentCollectionViewHeaderLabel, recommandContentCollectionView].forEach { addSubview($0) }
        
    }
    
    private func setConstraints() {
        
        bookIntroductionCell.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(667)
        }
        
        seriesCollectionViewHeaderLabel.snp.makeConstraints{
            $0.top.equalTo(self.bookIntroductionCell.snp.bottom).offset(39)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(21)
        }
        
        seriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.seriesCollectionViewHeaderLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().offset(20)
            $0.width.equalTo(1000)
            $0.height.equalTo(219)
        }
        
        bookImageCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.seriesCollectionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(258)
        }
        
        bookInformationCell.snp.makeConstraints {
            $0.top.equalTo(self.bookImageCollectionView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(634)
        }
        
        relatedKeywordCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.bookInformationCell.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(141)
        }
        
        detailedInformationCell.snp.makeConstraints{
            $0.top.equalTo(self.relatedKeywordCollectionView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(147)
        }
        
        recommandContentCollectionViewHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(self.detailedInformationCell.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(21)
        }
        
        recommandContentCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.recommandContentCollectionViewHeaderLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(219)
        }
    }
}

extension BookDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case seriesCollectionView:
            return CGSize(width: 105, height: 200)
            
        case bookImageCollectionView:
            return CGSize(width: 335, height: 258)
            
        case relatedKeywordCollectionView:
            guard let cell = relatedKeywordCollectionView.dequeueReusableCell(withReuseIdentifier: RelatedKeywordCollectionViewCell.identifier, for: indexPath) as? RelatedKeywordCollectionViewCell else {
                        return .zero
                    }
                    cell.keywordLabel.text = keywordDummy[indexPath.row].name
                    // ✅ sizeToFit() : 텍스트에 맞게 사이즈가 조절
                    cell.keywordLabel.sizeToFit()

                    // ✅ cellWidth = 글자수에 맞는 UILabel 의 width + 20(여백)
                    let cellWidth = cell.keywordLabel.frame.width + 20

                    return CGSize(width: cellWidth, height: 30)
            
        case recommandContentCollectionView:
            return CGSize(width: 105, height: 200)
            
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

extension BookDetailTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return seriesDummyData.count
        case 1:
            return bookImageDummyData.count
        case 2:
            return keywordDummy.count
        case 3:
            return seriesDummyData.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case seriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {return UICollectionViewCell()}
            cell.dataBind(model: seriesDummyData[indexPath.row])
            return cell
            
        case bookImageCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookImageCollectionViewCell.identifier, for: indexPath) as? BookImageCollectionViewCell else {return UICollectionViewCell()}
            cell.dataBind(model: bookImageDummyData[indexPath.row])
            return cell
            
        case relatedKeywordCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatedKeywordCollectionViewCell.identifier, for: indexPath) as? RelatedKeywordCollectionViewCell else {return UICollectionViewCell()}
            cell.configureUI(name: keywordDummy[indexPath.row])
            return cell
            
        case recommandContentCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {return UICollectionViewCell()}
            cell.dataBind(model: seriesDummyData[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}
