//
//  DiaryTableViewCell.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/01.
//

import UIKit
protocol DeleteDiaryDelegate {
    func deleteDiary(index:Int) -> ()
}
class DiaryTableViewCell: UITableViewCell, DeleteDiaryDelegate{
    var mainVC: MainViewController?
    var cellData: Diary!
    var index: Int?
    
    @IBOutlet weak var diaryTableViewCellDate: UILabel!
    
    @IBOutlet weak var diaryTableViewCellEmotion: UILabel!
    
    @IBOutlet weak var diaryTableViewCellContent: UILabel!
    
    @IBOutlet weak var diaryTableViewCellImage: UIImageView!
    override func awakeFromNib() { //Instance 화 될 때
        super.awakeFromNib()
        let tabGesture = UITapGestureRecognizer(target:self, action: #selector(cellTabEvent(sender:)))
        self.addGestureRecognizer(tabGesture)
        
        
        
    }
    @objc func cellTabEvent(sender: UITapGestureRecognizer) {
        guard let vc = mainVC?.storyboard?.instantiateViewController(withIdentifier: "diaryDetailViewController") as? DiaryDetailViewController else {return}
        
        vc.diaryCell = self
        vc.cellData = self.cellData
        vc.index = self.index
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        mainVC?.present(vc, animated: true)
        
    }
    func deleteDiary(index:Int){
        mainVC?.diaryListViewModel.deleteDiaryData(index: index)
        mainVC?.diaryListTableView.reloadData()
    }
}
