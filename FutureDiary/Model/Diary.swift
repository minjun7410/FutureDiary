//
//  Diary.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/26.
//

import Foundation
public struct Diary{
    let date:Date;
    let emotion:String?;
    let content:String;
    init(date:Date, emotion:String?, content:String){
        self.date = date;
        self.emotion = emotion;
        self.content = content;
    }
}
