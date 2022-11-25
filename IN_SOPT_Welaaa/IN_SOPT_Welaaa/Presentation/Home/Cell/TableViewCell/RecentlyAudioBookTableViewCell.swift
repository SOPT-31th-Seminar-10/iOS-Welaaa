//
//  RecentlyAudioBookTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

protocol RecentlyAudioBookCollectionViewCellDelegate {
    func selectedRecentlyAudioBookCollectionViewCell(_ tableView: UITableView, _ index: Int)
}

final class RecentlyAudioBookTableViewCell: UITableViewCell {
    
    static let identifier = "RecentlyAudioBookTableViewCell"
    
    var bookListData = [BookData(id: 0, title: "", description: "", image: "", author: "")] {
        didSet {
            recentlyAudioBookCollectionView.reloadData()
        }
    }
    
    var delegate: RecentlyAudioBookCollectionViewCellDelegate?
    
    lazy var recentlyAudioBookCollectionView =
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
        recentlyAudioBookCollectionView.register(RecommandAudioBookCollectionViewCell.self, forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier)
    }
    
    private func setupView() {
        contentView.addSubview(recentlyAudioBookCollectionView)
    }
    
    private func setConstraints() {
        recentlyAudioBookCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(375)
            $0.height.equalTo(244)
        }
    }
    
}

extension RecentlyAudioBookTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}

extension RecentlyAudioBookTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let recentlyAudioBookViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        recentlyAudioBookViewCell.update(book: bookListData, indexPath: indexPath)
        return recentlyAudioBookViewCell
    }
}

extension RecentlyAudioBookTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.selectedRecentlyAudioBookCollectionViewCell(UITableView(), indexPath.item)
        }
    }
}


