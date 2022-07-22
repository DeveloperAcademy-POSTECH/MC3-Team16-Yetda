//
//  CardListView.swift
//  Yetda
//
//  Created by 이채민 on 2022/07/18.
//

//import Foundation
//import UIKit

//class CardListView: UIView, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    let sampleImages = ["Aichi.png", "Akita.png", "Aomori.png", "Chiba.png", "Ehime.png", "Fukui.png"]
//
//    let cardCollectionView : UICollectionView = {
//
//            let layout = UICollectionViewFlowLayout()
//            layout.minimumLineSpacing = 10
//
//            layout.scrollDirection = .vertical
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//
//            return cv
//        }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setCollectionView()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setCollectionView()
//    }
//
//    private func setCollectionView() {
//        self.addSubview(cardCollectionView)
//        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        cardCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        cardCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        cardCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        cardCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
//        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = 300
//        let cellWidth = (width - 30) / 2
//        return CGSize(width: cellWidth, height: cellWidth * 4/3)
//    }
//
//}

