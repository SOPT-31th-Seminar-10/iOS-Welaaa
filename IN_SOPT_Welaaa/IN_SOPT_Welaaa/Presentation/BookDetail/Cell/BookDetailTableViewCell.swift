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
    
    private lazy var bookIntroductionCell = BookIntroductionView()
    
    private var pagerTab = UIView().then {
        $0.backgroundColor = .black
    }
    
    lazy var seriesCollectionView = SeriesCollectionView()
    
    
    lazy var bookImageCollectionView = BookImageCollectionView()
    
    private lazy var bookInformationCell = BookInformationView()
    
    private lazy var relatedKeywordCollectionView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    //    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.scrollDirection = .horizontal
    //
    //        $0.translatesAutoresizingMaskIntoConstraints = false
    //        $0.isScrollEnabled = true
    //        $0.backgroundColor = .white
    //        $0.showsHorizontalScrollIndicator = false
    //        $0.collectionViewLayout = layout
    //        //        $0.delegate = self
    //        //        $0.dataSource = self
    //    }
    private lazy var detailedInformationCell = DetailedInformationView()
    
    private lazy var recommandContentCollectionView = RecommandContentCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [bookIntroductionCell, pagerTab, seriesCollectionView, bookImageCollectionView,bookInformationCell,relatedKeywordCollectionView,detailedInformationCell ,recommandContentCollectionView].forEach { addSubview($0) }
        
    }
    
    private func setConstraints() {
        
        bookIntroductionCell.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(626)
        }
        
        pagerTab.snp.makeConstraints {
            $0.top.equalTo(self.bookIntroductionCell.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(41)
        }
        
        seriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.pagerTab.snp.bottom).offset(39)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
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
        
        recommandContentCollectionView.snp.makeConstraints{
            $0.top.equalTo(self.detailedInformationCell.snp.bottom).offset(40)
            $0.leading.equalTo(20)
            $0.width.equalTo(355)
            $0.height.equalTo(219)
        }
        
    }
}

extension SeriesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}

extension SeriesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(model: seriesDummyData[indexPath.row])
        return cell
    }
}

extension BookImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: 258)
    }
}


extension BookImageCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookImageDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookImageCollectionViewCell.identifier, for: indexPath) as? BookImageCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(model: bookImageDummyData[indexPath.row])
        return cell
    }
}


extension RecommandContentCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}

extension RecommandContentCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesDummyData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {return UICollectionViewCell()}
        cell.dataBind(model: seriesDummyData[indexPath.row])
        return cell
    }
}
