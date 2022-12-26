//
//  CreateViewController.swift
//  FutureDiary
//
//  Created by 송민준 on 2022/12/26.
//

import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var textEmotion: UITextField!
    
    @IBOutlet weak var textContent: UITextView!
    @IBOutlet weak var calanderSwitch: UISwitch!
    
    var dataDelegate: SendDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("createView is Created")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeButtonPushed(_ sender: UIButton) {
        guard let content = textContent?.text else {return}
        dataDelegate?.receiveData(responce: content)
        dismiss(animated: true)
    }
    
}
