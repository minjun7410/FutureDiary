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
    @IBOutlet weak var calendarSwitch: UISwitch!
    
    var dataDelegate: SendDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("createView is Created")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeButtonPushed(_ sender: UIButton) {
        guard let date = self.date?.date else {return}
        guard let content = self.textContent?.text else {return}
        let emotion:String? = self.textEmotion.text
        let doCalendar:Bool = calendarSwitch.isOn
        dataDelegate?.receiveData(date:date, emotion:emotion, content:content, doCalendar: doCalendar)
        dismiss(animated: true)
    }
    
}
