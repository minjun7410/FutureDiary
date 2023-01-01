//
//  DiaryDetailViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/01.
//

import UIKit
class DiaryDetailViewController : UIViewController {
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var emotion: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    var dateText = ""
    var emotionText = ""
    var contentText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = dateText
        emotion.text = emotionText
        content.text = contentText
    }
    @IBAction func backBtnPushedEvent(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
