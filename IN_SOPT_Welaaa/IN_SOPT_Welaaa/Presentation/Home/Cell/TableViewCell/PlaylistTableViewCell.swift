//
//  PlaylistTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class PlaylistTableViewCell: UITableViewCell {
    
    static let identifier = "PlaylistTableViewCell"
    
    var bookListData = [BookData(id: 0, title: "", description: "", image: "", author: "")] {
        didSet {
            playlistCollectionView.reloadData()
        }
    }
    
    lazy var playlistCollectionView =
    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
        //registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerCollectionView() {
        playlistCollectionView.delegate = self
        playlistCollectionView.dataSource = self
        playlistCollectionView.register(PlaylistCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
    }
    
    private func setupView() {
        contentView.addSubview(playlistCollectionView)
    }
    
    private func setConstraints() {
        playlistCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(450)
            $0.height.equalTo(149)
        }
    }
    
    func dataBind(bookList: [BookData]) {
        self.bookListData = bookList
    }
}

extension PlaylistTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 105)
    }
}

extension PlaylistTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as? PlaylistCollectionViewCell else {
            return UICollectionViewCell()}
     
        cell.update(book: bookListData, indexPath: indexPath)
        return cell
    }
}
