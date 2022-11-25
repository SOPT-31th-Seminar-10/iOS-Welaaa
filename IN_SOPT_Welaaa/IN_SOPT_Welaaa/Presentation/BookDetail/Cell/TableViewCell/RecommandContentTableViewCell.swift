//
//  RecommandContentTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class RecommandContentTableViewCell: UITableViewCell {
    
    static let identifier = "RecommandContentTableViewCell"
    
    lazy var recommandContentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
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
    
    private func setupView() {
        contentView.addSubview(recommandContentCollectionView)
    }
    
    private func setConstraints() {
        recommandContentCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-40)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(300)
        }
    }
    
    private func registerCollectionView() {
        recommandContentCollectionView.register(RecommandContentCollectionViewCell.self, forCellWithReuseIdentifier: RecommandContentCollectionViewCell.identifier)
    }
}

extension RecommandContentTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 178)
    }
}

extension RecommandContentTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandContentCollectionViewCell.identifier, for: indexPath) as? RecommandContentCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(model: seriesDummyData[indexPath.row])
        return cell
    }
}

