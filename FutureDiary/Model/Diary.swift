//
//  Diary.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/26.
//

import Foundation
public struct Diary{
    let index:Int;
    let date:Date;
    let emotion:String;
    let content:String;
    init(index:Int, date:Date, emotion:String, content:String){
        self.index = index;
        self.date = date;
        self.emotion = emotion;
        self.content = content;
    }
}
