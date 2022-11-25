//
//  RecommandAudioBookTableViewCell.swift
//  IN_SOPT_Welaaa
//
//  Created by 류희재 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

protocol RecommandAudioVBookCollectionViewCellDelegate {
    func selectedRecommandAudioVBookCollectionViewCell(_ tableView: UITableView, _ index: Int)
}

final class RecommandAudioBookTableViewCell: UITableViewCell {
    
    static let identifier = "RecommandAudioBookTableViewCell"
    
    var delegate: RecommandAudioVBookCollectionViewCellDelegate?
    
    lazy var recommandAudioBookCollectionView =
    UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.backgroundColor = .white
        $0.collectionViewLayout = layout
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        recommandAudioBookCollectionView.delegate = self
        recommandAudioBookCollectionView.dataSource = self
        recommandAudioBookCollectionView.register(RecommandAudioBookCollectionViewCell.self, forCellWithReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier)
    }
    
    private func setupView() {
        contentView.addSubview(recommandAudioBookCollectionView)
    }
    
    private func setConstraints() {
        recommandAudioBookCollectionView .snp.makeConstraints {
            $0.top.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(355)
            $0.height.equalTo(244)
        }
    }
    
}

extension RecommandAudioBookTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 200)
    }
}

extension RecommandAudioBookTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommandAudioBookDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let recommandAudioBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandAudioBookCollectionViewCell.identifier, for: indexPath) as? RecommandAudioBookCollectionViewCell else {
            return UICollectionViewCell()}
        recommandAudioBookCell.dataBind(model: recommandAudioBookDummyData[indexPath.row])
        return recommandAudioBookCell
    }
}

extension RecommandAudioBookTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.selectedRecommandAudioVBookCollectionViewCell(UITableView(), indexPath.item)
        }
    }
}

