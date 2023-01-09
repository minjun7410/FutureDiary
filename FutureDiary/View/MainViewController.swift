//
//  ViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/25.
//

import UIKit
protocol SendDataDelegate{
    func receiveData(date:Date, emotion:String?, content:String, doCalendar:Bool, imageData:Data?) -> Void
}
class MainViewController: UIViewController, SendDataDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let diaryListViewModel = DiaryListViewModel()
    
    @IBOutlet weak var diaryListTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryListViewModel.diaryList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath) as? DiaryTableViewCell else {return UITableViewCell()}
        cell.mainVC = self
        cell.cellData = diaryListViewModel.diaryList[indexPath.row]
        cell.index = indexPath.row
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.diaryTableViewCellDate.text = dateFormatter.string(from: cell.cellData.date)
        cell.diaryTableViewCellEmotion.text = cell.cellData.emotion
        cell.diaryTableViewCellContent.text = cell.cellData.content
        if let imageData = cell.cellData.imageData{
            cell.diaryTableViewCellImage.isHidden = false
            cell.diaryTableViewCellImage.image = UIImage(data: imageData)
        }
        else{
            cell.diaryTableViewCellImage.isHidden = true
            cell.diaryTableViewCellImage.image = nil
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateSegue"{
            guard let vc = segue.destination as? CreateViewController else { return }
            vc.dataDelegate = self
        }
    }
    @IBAction func createButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "CreateSegue", sender: nil)
    }
    
    func receiveData(date:Date, emotion:String?, content:String, doCalendar:Bool, imageData:Data?) {
        diaryListViewModel.createDiaryData(date:date, emotion: emotion, content: content, imageData:imageData)
        diaryListTableView.reloadData()
        
    }
}

