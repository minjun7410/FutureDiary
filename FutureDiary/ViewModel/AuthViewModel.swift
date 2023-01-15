//
//  AuthViewModel.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/11.
//

import Foundation
import FirebaseAuth

class AuthViewModel : NSObject {
    func logIn(email:String, password:String, completeClosure:((AuthDataResult?, (any Error)?) -> Void)?){
        print("Try Login: \(email), \(password)")
        Auth.auth().signIn(withEmail: email, password: password, completion: completeClosure)
    }
    func signIn(email:String, password:String, completeClousure:((AuthDataResult?, (any Error)?) -> Void)?){
        print("Try Signin: \(email), \(password)")
        Auth.auth().createUser(withEmail: email, password: password, completion: completeClousure)
    }
}
