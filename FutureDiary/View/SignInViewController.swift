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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let email:String = emailTextField.text!
        let password:String = passwordTextField.text!
        authViewModel.signIn(email: email, password: password) { user, error in
            if user != nil {
                self.statusBar.text = "회원가입 성공!"
                self.dismiss(animated: true)
                print("Sign In Success!")
                
            }
            else{
                self.statusBar.text = "유효하지 않은 아이디 또는 비밀번호입니다."
                print("Sign In Failed. \(error.debugDescription)")
            }
        }
    }
}
