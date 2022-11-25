//
//  BookImageTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class BookImageTableViewCell: UITableViewCell {
    
    static let identifier = "BookImageTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(bookImageCollectionView)
    }
    
    private func setConstraints() {
        bookImageCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-35)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(258)
        }
    }
    
    private func registerCollectionView() {
        bookImageCollectionView.register(BookImageCollectionViewCell.self, forCellWithReuseIdentifier: BookImageCollectionViewCell.identifier)
    }
}

extension BookImageTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: 258)
    }
}

extension BookImageTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookImageDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let bookImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: BookImageCollectionViewCell.identifier, for: indexPath) as? BookImageCollectionViewCell else {
            return UICollectionViewCell()}
        bookImageCell.dataBind(model: bookImageDummyData[indexPath.row])
        return bookImageCell
    }
}
