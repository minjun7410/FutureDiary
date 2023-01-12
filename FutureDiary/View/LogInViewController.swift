//
//  LogInViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2023/01/11.
//

import UIKit

class LogInViewController : UIViewController {
    
    @IBOutlet weak var emailTextBar: UITextField!
    @IBOutlet weak var passwordTextBar: UITextField!
    @IBOutlet weak var statusBar: UILabel!
    
    let authViewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        let email:String = emailTextBar.text!
        let password:String = passwordTextBar.text!
        authViewModel.logIn(email:email, password:password)
        { (user, error) in
            if user != nil {
                self.statusBar.text = "로그인 성공"
                print("Log In Success!")
            }
            else{
                self.statusBar.text = "이메일 또는 비밀번호가 옳지 않습니다."
                print("Log In Failed. \(error.debugDescription)")
            }
        }    }
}
