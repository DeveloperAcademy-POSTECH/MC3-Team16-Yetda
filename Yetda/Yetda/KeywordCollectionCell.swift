//
//  KeywordCollectionCell.swift
//  Yetda
//
//  Created by Youngseo Yoon on 2022/07/19.
//

import UIKit

class KeywordCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var keywordButton: UIButton!
    @IBAction func keywordButtonTapped(_ sender: Any) { }
    
    func configure(_ index: IndexPath) {
        customButton(keywordButton)
    }
}

// 버튼 커스터마이징 하는 함수
func customButton(_ button: UIButton) {
    button.layer.cornerRadius = 19.0
    button.layer.masksToBounds = true
    button.backgroundColor = UIColor.white
    button.layer.borderColor = CGColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
    button.layer.borderWidth = 1.0
}
