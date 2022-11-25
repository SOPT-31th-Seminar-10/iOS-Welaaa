//
//  ShelfViewController.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

import UIKit
import Then
import SnapKit

final class ShelfViewController: BaseViewController {
    
    // MARK: - Reusable Components
    
    private lazy var RecordCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.delegate = self
            $0.dataSource = self
        }
        return collectView
    }()

    private lazy var shelfCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
        }
        
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.delegate = self
            $0.dataSource = self
        }
        return collectView
    }()
    
    private lazy var bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        return collectView
    }()
    
    
    // MARK: - UI Components
    
    private let containerView = UIScrollView()
    private let titleLabel = UILabel().then {
        $0.text = "내 서랍"
        $0.font = .font(.pretendardSemibold, ofSize: 20)
        $0.textColor = Color.gray900
    }
    
    private let notificationButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "ic_alert"), for: .normal)
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_profile")
    }
    
    private let profileLabel = UILabel().then {
        $0.text = "우주최강 10조"
        $0.font = .font(.pretendardSemibold, ofSize: 20)
        $0.textColor = Color.gray900
    }
    
    private let recordContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let line = UIView().then {
        $0.backgroundColor = Color.gray100
    }
    
    // MARK: - Variables

    var categories: [String] = ["최근목록", "찜한 콘텐츠", "다운로드", "구매"]
    var recordTitles: [String] = ["재생시간", "오디오북", "클래스"]
    var recordContents: [String] = ["30분", "10권", "3회"]
    
    var bookList: [BookDto] = BookDto.sampleData()
    
    // MARK: - Constants
    
    final let kRecordInset: UIEdgeInsets = .zero
    final let kRecordInterItemSpacing: CGFloat = 0
    final let kRecordCellWidth: CGFloat = (UIScreen.main.bounds.width - 40) / 3
    
    final let kCategoryInset: UIEdgeInsets = .zero
    final let kCategoryLineSpacing: CGFloat = 8
    final let kCatgoriesCellWidths: [CGFloat] = [69, 81, 65, 40]
    
    final let kBookInset: UIEdgeInsets = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
    final let kBookInterItemSpacing: CGFloat = 10
    final let kBookLineSpacing: CGFloat = 20
    final let kBookCellHeight: CGFloat = 200
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
        applyShadow()
    }
}

// MARK: - Extensions

extension ShelfViewController {
    
    private func layout() {
        view.addSubview(containerView)
        [titleLabel, notificationButton, profileImageView, profileLabel, line, recordContainerView, shelfCategoryCollectionView, bookCollectionView].forEach {
            containerView.addSubview($0)
        }
        
        recordContainerView.addSubview(RecordCollectionView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            
        }
        
        notificationButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(19)
            $0.height.width.equalTo(44)
        }
        
        profileLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView.snp.centerY)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
        }
        
        recordContainerView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(17)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(76)
        }
        
        RecordCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(recordContainerView.snp.bottom).offset(29)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(4)
        }
        
        shelfCategoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.width.equalTo(view.safeAreaLayoutGuide).offset(-76)
            $0.height.equalTo(40)
        }
        
        bookCollectionView.snp.makeConstraints {
            $0.top.equalTo(shelfCategoryCollectionView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(calculateHeight())
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
        }
        
        
    }
    
    // MARK: - General Helpers
    
    private func register() {
        RecordCollectionView.register(RecordCollectionViewCell.self,
                                      forCellWithReuseIdentifier: RecordCollectionViewCell.identifier)
        shelfCategoryCollectionView.register(ShelfCategoryCollectionViewCell.self,
                                             forCellWithReuseIdentifier: ShelfCategoryCollectionViewCell.identifier)
        bookCollectionView.register(BookCollectionViewCell.self,
                                    forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        
    }
    
    private func calculateHeight() -> CGFloat {
        let bookCount : CGFloat = CGFloat(bookList.count)/3
        let lineCount = ceil(bookCount)
        return lineCount*200 + (lineCount-1)*20 + kBookInset.top + kBookInset.bottom
    }
    
    private func calculateWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 40 - 20) / 3
    }
    
    private func applyShadow() {
        recordContainerView.layer.cornerRadius = 8
        recordContainerView.layer.shadowColor = UIColor.black.cgColor
        recordContainerView.layer.shadowOpacity = 0.09
        recordContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        recordContainerView.layer.shadowRadius = 8
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ShelfViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case RecordCollectionView:
            return CGSize(width: kRecordCellWidth, height: 76)
        case shelfCategoryCollectionView:
            return CGSize(width: kCatgoriesCellWidths[indexPath.item], height: 40)
        default:
            return CGSize(width: calculateWidth(), height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case RecordCollectionView:
           return 0
        case shelfCategoryCollectionView:
            return kCategoryLineSpacing
        default:
            return kBookLineSpacing
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case RecordCollectionView:
            return kRecordInterItemSpacing
        case shelfCategoryCollectionView:
            return 0
        default:
            return kBookInterItemSpacing
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case RecordCollectionView:
            return kRecordInset
        case shelfCategoryCollectionView:
            return kCategoryInset
        default:
            return kBookInset
        }
    }
}


// MARK: - UICollectionViewDataSource

extension ShelfViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case RecordCollectionView:
            return 3
        case shelfCategoryCollectionView:
            return 4
        default:
            return bookList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case RecordCollectionView:
            guard let recordCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecordCollectionViewCell.identifier, for: indexPath)
                    as? RecordCollectionViewCell else { return UICollectionViewCell() }
            recordCell.dataBind(title: recordTitles[indexPath.item], content: recordContents[indexPath.item], isLined: indexPath.item != 2)
            return recordCell
            
        case shelfCategoryCollectionView:
            guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShelfCategoryCollectionViewCell.identifier, for: indexPath) as? ShelfCategoryCollectionViewCell else {return UICollectionViewCell() }
            categoryCell.dataBind(title: categories[indexPath.item], isSelected: indexPath.item == 0)
            return categoryCell
        default:
            guard let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath)
                    as? BookCollectionViewCell else { return UICollectionViewCell() }
            bookCell.dataBind(model: bookList[indexPath.item])
            return bookCell
            
            
        }
    }
    
    
}
