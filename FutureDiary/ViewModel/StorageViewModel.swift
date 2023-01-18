//
//  StorageViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/17.
//

import Foundation
import FirebaseStorage
class StorageViewModel : NSObject {
    let storage = Storage.storage()
    func uploadImage(uID:String, docID: String, imageData: Data){
        let storagePath = "gs://futurediary-1d630.appspot.com/\(uID)/\(docID).jpg"
        let storageRef = storage.reference(forURL: storagePath)
        
        let uploadTask = storageRef.putData(imageData, metadata: nil){ (metadata, error) in
            guard let metadata = metadata else {
                print("Upload Image Task has Failed : \(error.debugDescription)")
                return
            }
            storageRef.downloadURL { (url, error) in
                guard let url = url else {
                    print("Downloading URL has Failed : \(error.debugDescription)")
                    return
                }
                
            }
        }
    }
    func getImage(uID:String, docID: String, completion: @escaping (UIImage) -> Void){
        let storagePath = "gs://futurediary-1d630.appspot.com/\(uID)/\(docID).jpg"
        let storageRef = storage.reference(forURL: storagePath)
        storageRef.downloadURL{(url, error) in
            if let url = url{
                let data = NSData(contentsOf: url)
                if let data = data{
                    let image = UIImage(data: data as Data)
                    completion(image! as UIImage)
                }
            }
            if let error = error{
                print("Error Occured in getting image : \(error)")
            }
        }
    }
}
