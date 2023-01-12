//
//  AuthViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/11.
//

import Foundation
import FirebaseAuth
class AuthViewModel : NSObject {
    var currentUser: String?
    func checkLogIned(user:String) -> Bool{
        let curUser = currentUser ?? "Nothing"
        if curUser == user{
            return true
        }
        else {return false}
    }
    func logIn(email:String, password:String, completeClosure:((AuthDataResult?, (any Error)?) -> Void)?){
        print("Try Login: \(email), \(password)")
        Auth.auth().signIn(withEmail: email, password: password, completion: completeClosure)
    }
}
