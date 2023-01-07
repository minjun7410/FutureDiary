//
//  Diary.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/26.
//

import Foundation
public struct Diary{
    let date:Date
    let emotion:String?
    let content:String
    let imageData:Data?
    init(date:Date, emotion:String?, content:String, imageData:Data?){
        self.date = date
        self.emotion = emotion
        self.content = content
        self.imageData = imageData
    }
}
