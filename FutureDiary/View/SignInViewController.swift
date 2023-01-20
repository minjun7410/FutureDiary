//
//  SignInViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/13.
//

import UIKit

class SignInViewController : UIViewController{
    
    @IBOutlet weak var statusBar: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let authViewModel = AuthViewModel()
    let dbViewModel = DBViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let email:String = emailTextField.text!
        let password:String = passwordTextField.text!
        let nickname:String = nickNameTextField.text!
        authViewModel.signIn(email: email, password: password) { user, error in
            if let user = user {
                self.statusBar.text = "회원가입 성공!"
                self.dismiss(animated: true)
                self.dbViewModel.createUser(uid: user.user.uid, nickname: nickname)
                print("Sign In Success!")
                
            }
            else{
                self.statusBar.text = "유효하지 않은 아이디 또는 비밀번호입니다."
                print("Sign In Failed. \(error.debugDescription)")
            }
        }
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
