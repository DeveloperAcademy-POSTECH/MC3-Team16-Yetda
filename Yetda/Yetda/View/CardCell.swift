//
//  CardView.swift
//  Yetda
//
//  Created by 이채민 on 2022/07/18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CardCell: UICollectionViewCell {
    
    static let identifier = "PresentCardCell"

    var nameLabel: UILabel = UILabel()
    var firstImage: UIImage?
    var thumbnailImage: UIImageView = UIImageView()
    let disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        thumbnailImage.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCell() {
        self.contentView.addSubview(thumbnailImage)
        setThumbnailImage()
        self.contentView.addSubview(nameLabel)
        setNameLabel()
    }
    
    private func setThumbnailImage() {
        
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        thumbnailImage.clipsToBounds = true
        thumbnailImage.layer.cornerRadius = 20
        thumbnailImage.contentMode = .scaleAspectFill
    }
    
    private func setNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    func setData(_ model: String) {
        
        self.nameLabel.text = "이름"
        
//        self.nameLabel.text = model.whosFor
//        self.firstImage = UIImage(data: model.image1!)
        thumbnailImage.image = UIImage(named: model)
    }
    
}
