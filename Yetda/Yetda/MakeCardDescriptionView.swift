//
//  MakeCardDescriptionView.swift
//  Yetda
//
//  Created by Youngseo Yoon on 2022/07/18.
//

import UIKit

class MakeCardDescriptionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var giftNameTextField: UITextField!
    @IBOutlet weak var giftRecipientTextField: UITextField!
    @IBOutlet weak var photoCollection: UICollectionView!
    @IBOutlet weak var keywordCollection: UICollectionView!
    
    var photos: [String] = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    
    var keywords: [String] = ["☀️햇빛쨍쨍", "❄️눈이내려", "☔️비가내려", "🛍양손가득", "🤑플렉스~", "🧳짐이많아", "🥶너무추워", "🥵너무더워", "😋짱맛있대", "⭐️별다섯개", "👍추천받음", "🥰생각나서", "🫵완전너꺼", "🥳축하해~", "🤫비밀선물", "🍯완전달달", "💸비싼거야", "🗽관광중~", "🏝휴양중~"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderRadius(view: giftNameTextField).addLeftPadding()
        borderRadius(view: giftRecipientTextField).addLeftPadding()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var result: Int
        result = collectionView == self.photoCollection ? photos.count : keywords.count
        return result
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.photoCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionCell
            cell.chosenPhoto.image = UIImage(named: photos[indexPath.row])
            cell.layer.cornerRadius = 20.0
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "keywordCell", for: indexPath) as! KeywordCollectionCell
            cell.configure(indexPath)
            cell.keywordButton.setTitle(keywords[indexPath.item], for: .normal)
            return cell
        }
    }
}

// textField corner 둥글게, 보더 적용하는 함수
func borderRadius(view: UITextField) -> UITextField{
    view.layer.cornerRadius = 19.0
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.systemGray5.cgColor
    view.layer.masksToBounds = true
    return view
}

// textField 안에서 왼쪽 Padding 주는 함수
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}


