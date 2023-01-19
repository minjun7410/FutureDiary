//
//  DiaryCreateViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/28.
//

import Foundation

class DiaryListViewModel: NSObject{
    let dbViewModel = DBViewModel()
    var uID:String!
    
    var diary: Diary!
    var diaryList: [Diary]!
    override init() {
        super.init()
        diaryList = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    func initDiaryList(uID:String, completion: @escaping ()->Void){
        self.uID = uID
        dbViewModel.getDiaryList(uID: self.uID, addingClosure: {(diary) in
            self.diaryList.append(diary)
        }, completeClosure: completion)
        
    }
    func createDiaryData(uid:String, date:Date, emotion: String?, content: String, imageData:Data?){
        diary = Diary(date: date, emotion: emotion, content: content, imageData: imageData)
        print("DiaryList appended ( \(date), \(content) ) in DiaryCreateViewModel")
        
        dbViewModel.makeDocument(uid: uid, date: date, emotion: emotion, content: content, imageData: imageData)
        diaryList.append(diary)
    }
    func deleteDiaryData(index:Int){
        print("DiaryList delete index \(index)")
        diaryList.remove(at:index)
        
    }
}
