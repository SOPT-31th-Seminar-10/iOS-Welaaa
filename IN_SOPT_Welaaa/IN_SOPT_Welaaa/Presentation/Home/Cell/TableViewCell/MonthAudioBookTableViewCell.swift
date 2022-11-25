//
//  MonthAudioBookTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

protocol MonthAudioBookCollectionViewCellDelegate {
    func selectedMonthAudioBookCollectionViewCell(_ tableView: UITableView, _ index: Int)
}

final class MonthAudioBookTableViewCell: UITableViewCell {
    
    static let identifier = "MonthAudioBookTableViewCell"
    
    var bookListData = [BookData(id: 0, title: "", description: "", image: "", author: "")] {
        didSet {
            monthAudioBookCollectionView.reloadData()
        }
    }
    
    var delegate: MonthAudioBookCollectionViewCellDelegate?
    
    lazy var monthAudioBookCollectionView =
    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
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
    
    func registerCollectionView() {
        monthAudioBookCollectionView.register(MonthAudioBookCollectionViewCell.self, forCellWithReuseIdentifier: MonthAudioBookCollectionViewCell.identifier)
    }
    
    private func setupView() {
        contentView.addSubview(monthAudioBookCollectionView)
    }
    
    private func setConstraints() {
        monthAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(345)
        }
    }
    
    func dataBind(bookList: [BookData]) {
        self.bookListData = bookList
    }

    
}

extension MonthAudioBookTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 345)
    }
}

extension MonthAudioBookTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let monthAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthAudioBookCollectionViewCell.identifier, for: indexPath) as? MonthAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        monthAudioBookCell.update(book: bookListData, indexPath: indexPath)
        return monthAudioBookCell
    }
}

extension MonthAudioBookTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.selectedMonthAudioBookCollectionViewCell(UITableView(), indexPath.item)
        }
    }
}
