//
//  DiaryCreateViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/28.
//

import Foundation

class DiaryListViewModel: NSObject{
    var diary: Diary!
    var diaryList: [Diary]!
    override init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        diaryList = []
    }
    func createDiaryData(date:Date, emotion: String?, content: String, imageData:Data?){
        diary = Diary(date: date, emotion: emotion, content: content, imageData: imageData)
        print("DiaryList appended ( \(date), \(content) ) in DiaryCreateViewModel")
        diaryList.append(diary)
    }
    func deleteDiaryData(index:Int){
        print("DiaryList delete index \(index)")
        diaryList.remove(at:index)
        
    }
}
