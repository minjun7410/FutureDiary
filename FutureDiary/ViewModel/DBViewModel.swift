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
    override init(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd-hh-mm"
    }
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
                if let imageData = imageData {
                    self.storageViewModel.uploadImage(uID: uid, docID: ref!.documentID, imageData: imageData)
                }
            }
        }
    }
    func getDiaryList(uID:String, addingClosure:@escaping (Diary) -> Void, completeClosure:@escaping ()->Void){
        db.collection("users").document(uID).collection("diarys").getDocuments(completion:{ (querySnapshot, error) in
            if let error = error {
                print("Error Occured when getting Diary List : \(error)")
            }
            else {
                if let querySnapshot = querySnapshot {
                    var completeCount = 0
                    for i in 0 ..< querySnapshot.documents.count{
                        let document = querySnapshot.documents[i]
                        let docID = document.documentID
                        let docData = document.data()
                        
                        self.storageViewModel.getImage(uID:uID, docID: docID) {(docImageData) in
                            completeCount += 1
                            if let docImageData = docImageData{
                                let date = docData["date"] as? Timestamp
                                let diary = Diary(date:date!.dateValue(), emotion:docData["emotion"] as? String, content:docData["content"] as! String, imageData: docImageData)
                                addingClosure(diary)
                            }
                            else{
                                let date = docData["date"] as? Timestamp
                                let diary = Diary(date:date!.dateValue(), emotion:docData["emotion"] as? String, content:docData["content"] as! String, imageData: nil)
                                addingClosure(diary)
                            }
                            if completeCount == querySnapshot.documents.count-1 {
                                completeClosure()
                            }
                        }
                    }
                }
            }
            
        })
    }
    func getNickname(uid:String, completeClosure: @escaping ((DocumentSnapshot?, Error?) -> Void)) -> String{
        let docRef = db.collection("users").document(uid)
        docRef.getDocument(completion: completeClosure)
        return "Unknown"
    }
}
