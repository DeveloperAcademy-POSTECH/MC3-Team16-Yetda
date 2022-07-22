//
//  DidPresentViewController.swift
//  Yetda
//
//  Created by rbwo on 2022/07/18.
//

import UIKit

class DidPresentViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = UIImage(named: "background")
    }
    
    @IBAction func clickedBackButton(_ sender: Any) {
        // TODO: 요기 밑에 선물 했다는 Flag를 다시 바꿔주면 될 듯 -
        // dismiss 클로저 ?
        // ViewWillDisAppear ?
        // viewDidDisappear ?
        // hi~
        dismiss(animated: true)
    }
    
    @IBAction func clickedNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DidCardShare", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DidCardShareViewController") as! DidCardShareViewController
        
        /// 뒤에 뷰 계층이 없이 새로 아래 뷰 부터 계층이 시작됨
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
