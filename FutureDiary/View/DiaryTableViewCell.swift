//
//  DiaryTableViewCell.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/01.
//

import UIKit

class DiaryTableViewCell: UITableViewCell{
    var mainVC: UIViewController?
    @IBOutlet weak var diaryTableViewCellDate: UILabel!
    
    @IBOutlet weak var diaryTableViewCellEmotion: UILabel!
    
    @IBOutlet weak var diaryTableViewCellContent: UILabel!
    
    override func awakeFromNib() { //Instance 화 될 때
        super.awakeFromNib()
        let tabGesture = UITapGestureRecognizer(target:self, action: #selector(cellTabEvent(sender:)))
        self.addGestureRecognizer(tabGesture)
    }
    @objc func cellTabEvent(sender: UITapGestureRecognizer) {
        print("Touched!")
        guard let vc = mainVC?.storyboard?.instantiateViewController(withIdentifier: "diaryDetailViewController") as? DiaryDetailViewController else {return}
   
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        vc.dateText = diaryTableViewCellDate.text!
        if let emotion = diaryTableViewCellEmotion.text {
            vc.emotionText = emotion
        }
        vc.contentText = diaryTableViewCellContent.text!
        mainVC?.present(vc, animated: true)
        
    }
}
