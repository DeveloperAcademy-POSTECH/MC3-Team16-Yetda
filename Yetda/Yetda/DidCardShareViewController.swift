//
//  TestCardShareViewController.swift
//  Yetda
//
//  Created by rbwo on 2022/07/18.
//

import UIKit

class DidCardShareViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: 지금은 Test용
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.testLabel.text = "2"
            
            if self.testLabel.text == "2" {
                let storyboard = UIStoryboard(name: "DidPresent", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "DidPresentViewController") as! DidPresentViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    }

}
