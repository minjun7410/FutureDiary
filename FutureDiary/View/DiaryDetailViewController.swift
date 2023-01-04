//
//  DiaryDetailViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/01.
//

import UIKit
class DiaryDetailViewController : UIViewController {
    var diaryCell: DeleteDiaryDelegate?
    var cellData: Diary!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var emotion: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        date.text = dateFormatter.string(from:cellData.date)
        emotion.text = cellData.emotion
        content.text = cellData.content
    }
    @IBAction func backBtnPushedEvent(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func deleteBtnPushedEvent(_ sender: Any) {
        let alertVC = UIAlertController(title:"알림", message: "정말로 삭제하시겠습니까?", preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title:"아니오", style:.destructive, handler:{_ in print("No Clicked!")}))
        alertVC.addAction(UIAlertAction(title:"네", style:.cancel, handler:{
            _ in self.diaryCell?.deleteDiary(index: self.index)
            self.presentingViewController?.dismiss(animated:true)
        }))
        self.present(alertVC, animated: true)
        
        
    }
}
