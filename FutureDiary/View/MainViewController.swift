//
//  ViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/25.
//

import UIKit
protocol SendDataDelegate{
    func receiveData(date:Date, emotion:String?, content:String, doCalendar:Bool) -> Void
}
class MainViewController: UIViewController, SendDataDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private let diaryListViewModel = DiaryListViewModel()
    
    @IBOutlet weak var diaryListTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        diaryListViewModel.diaryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "diaryCell", for: indexPath) as? DiaryTableViewCell else {return UITableViewCell()}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        cell.diaryTableViewCellDate.text = dateFormatter.string(from: diaryListViewModel.diaryList[indexPath.row].date)
        cell.diaryTableViewCellEmotion.text = diaryListViewModel.diaryList[indexPath.row].emotion
        cell.diaryTableViewCellContent.text = diaryListViewModel.diaryList[indexPath.row].content
        
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
    
    func receiveData(date:Date, emotion:String?, content:String, doCalendar:Bool) {
        diaryListViewModel.createDiaryData(date, emotion: emotion, content: content)
        diaryListTableView.reloadData()

    }
}
class DiaryTableViewCell: UITableViewCell{
    
    @IBOutlet weak var diaryTableViewCellDate: UILabel!
    
    @IBOutlet weak var diaryTableViewCellEmotion: UILabel!
    
    @IBOutlet weak var diaryTableViewCellContent: UILabel!
    
}
