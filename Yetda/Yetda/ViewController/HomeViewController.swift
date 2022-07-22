//
//  HomeViewController.swift
//  Yetda
//
//  Created by 이채민 on 2022/07/18.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import YPImagePicker

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let sampleImages = ["Aichi.png", "Akita.png", "Aomori.png", "Chiba.png", "Ehime.png", "Fukui.png"]

    let topView = UIView()
    let cardListView = UIView()
    let cardCell = CardCell()
    let cardCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
           
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    let backgroundImage = UIImageView()
    let planeBtn = UIButton(type: .custom)
    let profileBtn = UIButton(type: .custom)
    let cityLabel = UILabel()
    
    let viewModel = CardListViewModel()
    let disposeBag = DisposeBag()
    
    var imageCount = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(topView)
        setTopView()
        self.view.addSubview(cardListView)
        setCardListView()
        
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        
//        self.viewModel.getPresentList()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let cellWidth = (width - 36) / 2
        return CGSize(width: cellWidth, height: cellWidth * 4/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleImages.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        if (indexPath.row == 0) {
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .black
            cardCell.setData(sampleImages[indexPath.row - 1])
            cell.thumbnailImage.image = UIImage(named: sampleImages[indexPath.row - 1])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        if (indexPath.row == 0) {
            var config = YPImagePickerConfiguration()
            config.library.maxNumberOfItems = 5 - self.imageCount
            config.library.preSelectItemOnMultipleSelection = false
            config.library.defaultMultipleSelection = true
            config.library.mediaType = .photo
            config.library.isSquareByDefault = false
            config.onlySquareImagesFromCamera = false
            config.hidesCancelButton = false
            config.bottomMenuItemSelectedTextColour = UIColor(displayP3Red: 48/255, green: 113/255, blue: 231/255, alpha: 1.0)
            config.startOnScreen = .library
            config.wordings.libraryTitle = "모든 사진"
            config.wordings.albumsTitle = "앨범 목록"
            config.wordings.cameraTitle = "카메라"
            config.wordings.cover = "커버 사진"
            config.wordings.crop = "사진 크롭"
            config.wordings.filter = "필터 적용"
            config.wordings.save = "저장"
            config.wordings.ok = "확인"
            config.wordings.processing = "진행중"
            config.wordings.cancel = "취소"
            config.wordings.done = "완료"
            config.wordings.next = "다음"
            config.wordings.warningMaxItemsLimit = "최대 5장까지 첨부 가능합니다"
            
            let imagePicker = YPImagePicker(configuration: config)
            imagePicker.didFinishPicking{[unowned imagePicker] items, _ in
                var newImages:[UIImage] = []
                
                for item in items {
                    switch item{
                    case .photo(let photo):
                        newImages += [photo.image]
                    case .video:
                        print("비디오는 아직 준비중이에요ㅜ")
                    }
                    
                }
//                self.selectedImages.accept(self.selectedImages.value+newImages)
                imagePicker.dismiss(animated: true)
            }
            imagePicker.view.backgroundColor = .white
            self.present(imagePicker, animated: true)
        }
        else {
            
        }
    }
    
    private func setTopView() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        topView.addSubview(backgroundImage)
        setBackgroundImage()
        topView.addSubview(planeBtn)
        setPlaneBtn()
        topView.addSubview(profileBtn)
        setProfileBtn()
        topView.addSubview(cityLabel)
        setCityLabel()
    }
    
    private func setCardListView() {
        cardListView.layer.cornerRadius = 20
        cardListView.backgroundColor = UIColor(displayP3Red: 249/255, green: 250/255, blue: 253/255, alpha: 1.0)
        cardListView.clipsToBounds = true
        
        cardListView.translatesAutoresizingMaskIntoConstraints = false
        cardListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        cardListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        cardListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 125).isActive = true
        cardListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        cardListView.addSubview(cardCollectionView)
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cardCollectionView.leadingAnchor.constraint(equalTo: cardListView.leadingAnchor).isActive = true
        cardCollectionView.trailingAnchor.constraint(equalTo: cardListView.trailingAnchor).isActive = true
        cardCollectionView.topAnchor.constraint(equalTo: cardListView.topAnchor).isActive = true
        cardCollectionView.bottomAnchor.constraint(equalTo: cardListView.bottomAnchor).isActive = true
        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        
//        bindCollectionCardData()
    }
    
    private func setBackgroundImage() {
        
        backgroundImage.image = UIImage(named: "HomeViewBG")
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
       
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    private func setPlaneBtn() {
        
        planeBtn.setImage(UIImage(named: "PlaneBtn"), for: .normal)
        
        planeBtn.translatesAutoresizingMaskIntoConstraints = false
        planeBtn.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true
        planeBtn.topAnchor.constraint(equalTo: topView.topAnchor, constant: 65).isActive = true
        
//        planeBtn.rx.tap.bind {
//            self.navigationController?.pushViewController(TravelViewController(), animated: true)
//        }.disposed(by: disposeBag)
        
    }
    
    private func setProfileBtn() {
        
        profileBtn.setImage(UIImage(named: "ProfileBtn"), for: .normal)
        
        profileBtn.translatesAutoresizingMaskIntoConstraints = false
        profileBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20).isActive = true
        profileBtn.topAnchor.constraint(equalTo: topView.topAnchor, constant: 65).isActive = true
        
//        profileBtn.rx.tap.bind {
//            self.navigationController?.pushViewController(ProfileViewController(), animated: true)
//        }.disposed(by: disposeBag)
        
    }
    
    private func setCityLabel() {
        cityLabel.text = "후쿠오카"
        let font = UIFont.systemFont(ofSize: 25, weight: .bold)
        cityLabel.font = font
        cityLabel.textColor = .white
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.leadingAnchor.constraint(equalTo: planeBtn.leadingAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: planeBtn.bottomAnchor, constant: 20).isActive = true
    }
    
    private func bindCollectionCardData() {
        
//        let collectionView = cardListView.cardCollectionView
//
//        viewModel.presentList.bind(to: collectionView.rx.items(cellIdentifier: "PresentCardCell", cellType: CardCell.self)) { row, model, cell in
//            print(model)
//            cell.setData(model)
//        }.disposed(by: disposeBag)
//
//        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
//
//        collectionView.rx.itemSelected.bind { indexPath in
//            self.cardListView.cardCollectionView.deselectItem(at: indexPath, animated: true)
//            guard let present = self.viewModel.getPresentAt(indexPath) else { return }
//            self.sendCardData(card: present)
//        }.disposed(by: disposeBag)
    }
    
    private func sendCardData(card: Present) {
//        let controller = CardDetailViewController()
//        controller.cardId = present.id
//        controller.cardSelected = present
//        self.navigationController!.pushViewController(controller, animated: true)
    }
}

