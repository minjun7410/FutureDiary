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
    func createDiaryData(_ date:Date, emotion: String?, content: String){
        diary = Diary(date: date, emotion: emotion, content: content)
        print("DiaryList appended ( \(date), \(content) ) in DiaryCreateViewModel")
        diaryList.append(diary)
    }
}
