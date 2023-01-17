//
//  DBViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/15.
//

import Foundation
import FirebaseFirestore

class DBViewModel : NSObject {
    let storageViewModel = StorageViewModel()
    
    let db = Firestore.firestore()
    func createUser(uid:String, nickname:String){
        db.collection("users").document(uid).setData(["nickname": nickname]){ err in
            if let err = err {
                print("Error Occured from addDocument : \(err)")
            }
            else{
                print("Adding Document is Success!")
            }
        }
    }
    func makeDocument(uid:String, date:Date, emotion: String?, content: String, imageData: Data?){
        var ref: DocumentReference?
        ref = db.collection("users").document(uid).collection("diarys").addDocument(data:
                                                                                        ["date" : Timestamp(date: date),
                                                                                         "emotion" : emotion ?? "",
                                                                                         "content" : content,
                                                                                        ])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    func getNickname(uid:String, completeClosure: @escaping ((DocumentSnapshot?, Error?) -> Void)) -> String{
        let docRef = db.collection("users").document(uid)
        docRef.getDocument(completion: completeClosure)
        return "Unknown"
    }
}
