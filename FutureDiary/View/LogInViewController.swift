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
            if let user = user {
                self.statusBar.text = "로그인 성공"
                print("Log In Success!")
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as? MainViewController else {return}
                    mainVC.modalPresentationStyle = .fullScreen
                    mainVC.uid = user.user.uid
                    mainVC.diaryListViewModel.initDiaryList(uID: mainVC.uid){
                        self.present(mainVC, animated: true)
                    }
                })
                
            }
            else{
                self.statusBar.text = "이메일 또는 비밀번호가 옳지 않습니다."
                print("Log In Failed. \(error.debugDescription)")
            }
        }
        
    }
}
