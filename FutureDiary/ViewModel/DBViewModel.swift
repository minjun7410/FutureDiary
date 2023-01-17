//
//  DBViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/15.
//

import Foundation
import FirebaseFirestore

class DBViewModel : NSObject {
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
    
    func getNickname(uid:String, completeClosure: @escaping ((DocumentSnapshot?, Error?) -> Void)) -> String{
        let docRef = db.collection("users").document(uid)
        docRef.getDocument(completion: completeClosure)
        return "Unknown"
    }
}
